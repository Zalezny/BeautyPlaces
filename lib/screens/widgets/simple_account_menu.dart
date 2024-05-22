import 'package:flutter/material.dart';

import 'arrow_clipper.dart';

// based on Zach Roszczewski

class SimpleAccountMenu extends StatefulWidget {
  final Function(int) onChoice;
  const SimpleAccountMenu({
    super.key,
    required this.onChoice,
  });

  @override
  State<SimpleAccountMenu> createState() => _SimpleAccountMenuState();
}

class _SimpleAccountMenuState extends State<SimpleAccountMenu> with SingleTickerProviderStateMixin {
  final backgroundColor = Colors.white;
  final iconColor = Colors.black;
  final icons = [
    const Icon(Icons.favorite),
    const Icon(Icons.add_location),
  ];
  late OverlayEntry _overlayEntry;
  late BorderRadius _borderRadius;
  late AnimationController _animationController;
  bool isMenuOpen = false;
  late Offset buttonPosition;
  late Size buttonSize;
  late LabeledGlobalKey _key;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _borderRadius = BorderRadius.circular(4);
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    _animationController.reverse();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: _borderRadius,
      ),
      child: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
        ),
        color: Colors.black,
        onPressed: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height,
          left: buttonPosition.dx,
          width: buttonSize.width,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipPath(
                    clipper: ArrowClipper(),
                    child: Container(
                      width: 17,
                      height: 17,
                      color: backgroundColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: icons.length * buttonSize.height,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: _borderRadius,
                    ),
                    child: Theme(
                      data: ThemeData(
                        iconTheme: IconThemeData(
                          color: iconColor,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(icons.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              widget.onChoice(index);
                              closeMenu();
                            },
                            child: SizedBox(
                              width: buttonSize.width,
                              height: buttonSize.height,
                              child: icons[index],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
