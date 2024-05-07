import 'package:flutter/material.dart';

class ZoomButtons extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final double minZoom;
  final double maxZoom;
  final double zoom;
  ZoomButtons({
    super.key,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.minZoom,
    required this.maxZoom,
    required this.zoom,
  });

  final inActiveBtnColor = Colors.grey.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 40,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: Colors.black.withOpacity(0.35),
          width: 1.8,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (zoom < maxZoom) {
                  onZoomIn();
                }
              },
              child: Container(
                color: zoom == maxZoom ? inActiveBtnColor : Colors.white,
                width: double.infinity,
                child: const Icon(
                  Icons.add,
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (zoom > minZoom) {
                  onZoomOut();
                }
              },
              child: Container(
                color: zoom == minZoom ? inActiveBtnColor : Colors.white,
                width: double.infinity,
                child: const Icon(Icons.remove),
              ),
            ),
          )
        ],
      ),
    );
  }
}
