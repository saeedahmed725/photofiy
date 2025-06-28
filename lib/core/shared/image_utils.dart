import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photofiy/core/services/dio_factory.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class ImageUtils {
  static Future<bool> shareImage(String imageUrl, String imageName) async {
    try {
      final Directory tempDir = await getTemporaryDirectory();
      final String fileName = '${imageName.replaceAll(' ', '_')}.jpg';
      final String filePath = '${tempDir.path}/$fileName';

      await DioFactory.getDio().download(imageUrl, filePath);

      final File file = File(filePath);
      if (await file.exists()) {
        final result = await SharePlus.instance.share(
          ShareParams(
            files: [XFile(file.path)],
            text: 'Check out this amazing image!',
          ),
        );
        return result.status == ShareResultStatus.success;
      }
      return false;
    } catch (e) {
      debugPrint('Error sharing image: $e');
      return false;
    }
  }

  static Future<bool> downloadImage(String imageUrl, String imageName) async {
    try {
      // Request storage permission
      final permission = await Permission.storage.request();
      if (!permission.isGranted) {
        return false;
      }

      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory != null) {
        final String fileName =
            '${imageName.replaceAll(' ', '_')}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final String filePath = '${directory.path}/$fileName';

        await DioFactory.getDio().download(imageUrl, filePath);

        final File file = File(filePath);
        return await file.exists();
      }
      return false;
    } catch (e) {
      debugPrint('Error downloading image: $e');
      return false;
    }
  }

  static Future<bool> setAsWallpaper(String imageUrl, int location) async {
    try {
      final tempPath =
          '${Directory.systemTemp.path}/wallpaper_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final file = File(tempPath);

      // Download image directly to file
      await DioFactory.getDio().download(imageUrl, tempPath);

      final wallpaperManager = WallpaperManagerFlutter();
      final result = await wallpaperManager.setWallpaper(file, location);

      // Delete the temporary file after setting wallpaper
      await file.delete();

      return result;
    } on PlatformException catch (e) {
      debugPrint('Platform exception setting wallpaper: $e');
      return false;
    } catch (e) {
      debugPrint('Error setting wallpaper: $e');
      return false;
    }
  }

  static Future<Uint8List?> downloadImageBytes(String imageUrl) async {
    try {
      final response = await DioFactory.getDio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      debugPrint('Error downloading image bytes: $e');
      return null;
    }
  }
}
