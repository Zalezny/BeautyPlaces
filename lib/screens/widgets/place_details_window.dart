import 'package:beauty_places/data/models/place_model.dart';
import 'package:flutter/material.dart';

class PlaceDetailsWindow extends StatelessWidget {
  final PlaceModel place;
  const PlaceDetailsWindow({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: Container(
        height: 383,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 40,
          maxHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(29),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 33,
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Container(),
        ),
      ),
    );
  }
}
