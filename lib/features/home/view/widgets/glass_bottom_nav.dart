import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class GlassBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items;
  final double height;
  final EdgeInsets margin;
  final bool showLabels;
  final bool showIndicator;
  final Color? selectedColor;
  final Color? unselectedColor;

  const GlassBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.height = 70,
    this.margin = const EdgeInsets.only(left: 16, right: 16, bottom: 20),
    this.showLabels = true,
    this.showIndicator = true,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  State<GlassBottomNavigationBar> createState() =>
      _GlassBottomNavigationBarState();
}

class _GlassBottomNavigationBarState extends State<GlassBottomNavigationBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _rippleController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rippleAnimation;
  int previousIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _rippleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rippleController, curve: Curves.easeOut),
    );

    previousIndex = widget.currentIndex;
  }

  @override
  void didUpdateWidget(GlassBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      previousIndex = oldWidget.currentIndex;
      _animationController.forward().then((_) {
        _animationController.reverse();
      });
      _rippleController.forward().then((_) {
        _rippleController.reset();
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  Color get _selectedColor => widget.selectedColor ?? Colors.white;

  Color get _unselectedColor =>
      widget.unselectedColor ?? Colors.white.withValues(alpha: 0.6);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: widget.margin,
        child: Stack(
          children: [
            LiquidGlass(
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
                height: widget.height,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.05),
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(widget.items.length, (index) {
                    return Expanded(child: _buildNavItem(index));
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final isSelected = index == widget.currentIndex;
    final item = widget.items[index];

    return GestureDetector(
      onTap: () {
        if (index != widget.currentIndex) {
          widget.onTap(index);
        }
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          final scale = isSelected ? _scaleAnimation.value : 1.0;

          return Transform.scale(
            scale: scale,
            child: SizedBox(
              height: widget.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Ripple effect
                  if (isSelected)
                    AnimatedBuilder(
                      animation: _rippleAnimation,
                      builder: (context, child) {
                        return Container(
                          width: 60 * _rippleAnimation.value,
                          height: 60 * _rippleAnimation.value,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedColor.withValues(
                              alpha: 0.1 * (1 - _rippleAnimation.value),
                            ),
                          ),
                        );
                      },
                    ),

                  // Background highlight
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic,
                    width: isSelected ? 55 : 0,
                    height: isSelected ? 55 : 0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? _selectedColor.withValues(alpha: 0.1)
                          : Colors.transparent,
                      border: isSelected
                          ? Border.all(
                              color: _selectedColor.withValues(alpha: 0.2),
                              width: 1,
                            )
                          : null,
                    ),
                  ),

                  // Content
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon with custom animation
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutBack,
                        transform: Matrix4.identity()
                          ..scale(isSelected ? 1.1 : 1.0)
                          ..translate(0.0, isSelected ? -2.0 : 0.0),
                        child: _buildIcon(item, isSelected),
                      ),

                      if (widget.showLabels && item.label != null)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubic,
                          height: isSelected ? 20 : 0,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: isSelected ? 1.0 : 0.0,
                            child: Text(
                              item.label!,
                              style: TextStyle(
                                color: _selectedColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                height: 0,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                    ],
                  ),

                  // Micro-interaction dot
                  if (isSelected && !widget.showLabels)
                    Positioned(
                      bottom: 15,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedColor,
                          boxShadow: [
                            BoxShadow(
                              color: _selectedColor.withValues(alpha: 0.5),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIcon(BottomNavigationBarItem item, bool isSelected) {
    Widget iconWidget;

    if (item.icon is Icon) {
      final iconData = isSelected && item.activeIcon is Icon
          ? (item.activeIcon as Icon).icon!
          : (item.icon as Icon).icon!;

      iconWidget = Icon(
        iconData,
        color: isSelected ? _selectedColor : _unselectedColor,
        size: 20,
      );
    } else {
      iconWidget = isSelected ? item.activeIcon : item.icon;
    }

    // Add a subtle glow effect for selected items
    if (isSelected) {
      return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: _selectedColor.withValues(alpha: 0.3),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: iconWidget,
      );
    }

    return iconWidget;
  }
}
