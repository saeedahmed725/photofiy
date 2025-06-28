import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class GlassSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  final List<String> suggestions;
  final ValueChanged<String>? onSuggestionTap;
  final double textFieldHeight;
  final double maxSuggestionsHeight;
  final EdgeInsets padding;
  final ValueChanged<String>? onCategoryTap;

  const GlassSearchBar({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.controller,
    this.suggestions = const [],
    this.onSuggestionTap,
    this.textFieldHeight = 50.0,
    this.maxSuggestionsHeight = 200.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    this.onCategoryTap,
  });

  @override
  State<GlassSearchBar> createState() => _GlassSearchBarState();

  @override
  Size get preferredSize {
    double height = textFieldHeight + padding.vertical;

    // Add suggestions height if they would be shown
    if (suggestions.isNotEmpty) {
      // Calculate approximate height for suggestions
      // Each ListTile is approximately 48 pixels (dense: true makes it ~40)
      const double tileHeight = 40.0;
      const double suggestionsMargin = 8.0;
      const double suggestionsPadding = 16.0;

      double suggestionsHeight =
          (suggestions.length * tileHeight) +
          suggestionsPadding +
          suggestionsMargin;

      // Limit to maxSuggestionsHeight
      suggestionsHeight = suggestionsHeight > maxSuggestionsHeight
          ? maxSuggestionsHeight + suggestionsMargin
          : suggestionsHeight;

      height += suggestionsHeight;
    }

    return Size.fromHeight(height + 150);
  }
}

class _GlassSearchBarState extends State<GlassSearchBar>
    with TickerProviderStateMixin {
  late TextEditingController _controller;
  bool _showSuggestions = false;
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    // Animation setup for smooth suggestions appearance
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<double>(begin: -10.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onTextChange);
  }

  void _onFocusChange() {
    final shouldShow =
        _focusNode.hasFocus &&
        widget.suggestions.isNotEmpty &&
        _controller.text.isNotEmpty;

    if (shouldShow != _showSuggestions) {
      setState(() {
        _showSuggestions = shouldShow;
      });

      if (_showSuggestions) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  void _onTextChange() {
    final shouldShow =
        _focusNode.hasFocus &&
        widget.suggestions.isNotEmpty &&
        _controller.text.isNotEmpty;

    if (shouldShow != _showSuggestions) {
      setState(() {
        _showSuggestions = shouldShow;
      });

      if (_showSuggestions) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  double get _calculatedTextFieldHeight {
    return widget.textFieldHeight;
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.removeListener(_onFocusChange);
    _controller.removeListener(_onTextChange);

    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: widget.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Main search bar
            SizedBox(
              height: _calculatedTextFieldHeight,

              child: LiquidGlass(
                settings: LiquidGlassSettings(
                  ambientStrength: 0.5,
                  blur: 3,
                  lightAngle: 0.2 * math.pi,
                  glassColor: Colors.black26,
                  thickness: 10,
                ),
                shape: LiquidRoundedSuperellipse(
                  borderRadius: Radius.circular(40),
                ),
                glassContainsChild: false,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 16),
                      Icon(
                        Icons.search,
                        color: Colors.white.withValues(alpha: 0.8),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText: widget.hintText ?? 'Search images...',
                            hintStyle: TextStyle(
                              color: Colors.white.withValues(alpha: 0.6),
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onChanged: widget.onChanged,
                          onSubmitted: widget.onSubmitted,
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: _controller.text.isNotEmpty
                            ? GestureDetector(
                                key: const ValueKey('clear_button'),
                                onTap: () {
                                  _controller.clear();
                                  widget.onClear?.call();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.white.withValues(alpha: 0.8),
                                    size: 20,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(key: ValueKey('empty')),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),

            // Animated suggestions dropdown
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                if (!_showSuggestions || widget.suggestions.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Transform.translate(
                  offset: Offset(0, _slideAnimation.value),
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      constraints: BoxConstraints(
                        maxHeight: widget.maxSuggestionsHeight,
                      ),
                      child: LiquidGlass(
                        settings: LiquidGlassSettings(
                          ambientStrength: 0.5,
                          blur: 3,
                          lightAngle: 0.2 * math.pi,
                          glassColor: Colors.black26,
                          thickness: 10,
                        ),
                        shape: LiquidRoundedSuperellipse(
                          borderRadius: Radius.circular(12),
                        ),
                        glassContainsChild: false,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: widget.suggestions.length,
                            itemBuilder: (context, index) {
                              final suggestion = widget.suggestions[index];
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    _controller.text = suggestion;
                                    widget.onSuggestionTap?.call(suggestion);
                                    _focusNode.unfocus();
                                  },
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.history,
                                          color: Colors.white.withValues(
                                            alpha: 0.6,
                                          ),
                                          size: 18,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            suggestion,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            CategoryChipsList(
              categories: [
                "nature",
                "sky",
                "wallpaper",
                "office",
                "beach",
                "forest",
                "cat",
                "flowers",
                "office background",
                "dog",
                "flower",
                "man",
                "iphone wallpaper",
              ],
              onCategoryTap: (category) {
                _controller.text = category;
                widget.onCategoryTap?.call(category);
                _focusNode.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Helper extension to get the dynamic height
extension GlassSearchBarHeight on GlassSearchBar {
  static double calculateHeight({
    required double textFieldHeight,
    required List<String> suggestions,
    required double maxSuggestionsHeight,
    required EdgeInsets padding,
    bool showSuggestions = false,
  }) {
    double height = textFieldHeight + padding.vertical;

    if (showSuggestions && suggestions.isNotEmpty) {
      const double tileHeight = 40.0;
      const double suggestionsMargin = 8.0;
      const double suggestionsPadding = 16.0;

      double suggestionsHeight =
          (suggestions.length * tileHeight) +
          suggestionsPadding +
          suggestionsMargin;

      suggestionsHeight = suggestionsHeight > maxSuggestionsHeight
          ? maxSuggestionsHeight + suggestionsMargin
          : suggestionsHeight;

      height += suggestionsHeight;
    }

    return height;
  }
}

class CategoryChipsList extends StatelessWidget {
  final List<String> categories;
  final ValueChanged<String>? onCategoryTap;

  const CategoryChipsList({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => onCategoryTap?.call(category),
            child: LiquidGlass(
              settings: LiquidGlassSettings(
                ambientStrength: 0.5,
                blur: 3,
                lightAngle: 0.2 * math.pi,
                glassColor: Colors.black26,
                thickness: 10,
              ),
              shape: LiquidRoundedSuperellipse(
                borderRadius: Radius.circular(40),
              ),
              glassContainsChild: false,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                ),
                child: Text(
                  category,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
