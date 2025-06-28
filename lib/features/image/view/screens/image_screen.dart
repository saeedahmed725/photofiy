import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/core/utils/extension/extension.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
import 'package:photofiy/features/image/view/bloc/image_actions_bloc.dart';
import 'package:photofiy/features/image/view/widgets/animated_hero_image_widget.dart';
import 'package:photofiy/features/image/view/widgets/animated_image_app_bar.dart';
import 'package:photofiy/features/image/view/widgets/image_bottom_details_panel.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key, required this.image});

  final PixabayImage image;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  bool _showDetails = true;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Initialize animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
  }

  void _startAnimations() {
    _fadeController.forward();
    _slideController.forward();
    _scaleController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _toggleDetails() {
    setState(() {
      _showDetails = !_showDetails;
    });

    if (_showDetails) {
      _slideController.forward();
      _fadeController.forward();
    } else {
      _slideController.reverse();
      _fadeController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageActionsBloc(),
      child: Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.black,
          extendBodyBehindAppBar: true,
          appBar: AnimatedImageAppBar(
            fadeAnimation: _fadeAnimation,
            showDetails: _showDetails,
            imageUrl: widget.image.largeImageURL,
            imageName: widget.image.tags.split(',').first.trim(),
          ),
          body: BlocListener<ImageActionsBloc, ImageActionsState>(
            listener: (context, state) {
              if (state is ImageActionsSuccess) {
                context.showSnackBar(state.message);
              } else if (state is ImageActionsFailure) {
                context.showSnackBar(state.error);
              }
            },
            child: GestureDetector(
              onTap: _toggleDetails,
              child: Stack(
                children: [
                  // Hero Image
                  AnimatedHeroImageWidget(
                    image: widget.image,
                    scaleAnimation: _scaleAnimation,
                  ),

                  // Bottom Details Panel
                  ImageBottomDetailsPanel(
                    image: widget.image,
                    slideAnimation: _slideAnimation,
                    fadeAnimation: _fadeAnimation,
                    showDetails: _showDetails,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
