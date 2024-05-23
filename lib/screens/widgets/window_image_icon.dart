import 'package:flutter/material.dart';

class WindowImageIcon extends StatelessWidget {
  final VoidCallback onIconTap;
  final IconData icon;

  const WindowImageIcon({
    super.key,
    required this.onIconTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.6),
      alignment: Alignment.center,
      height: 50,
      width: 50,
      child: IconButton(
        onPressed: onIconTap,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
