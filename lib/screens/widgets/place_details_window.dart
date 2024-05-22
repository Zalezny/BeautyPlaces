import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/screens/widgets/window_image.dart';
import 'package:flutter/material.dart';

class PlaceDetailsWindow extends StatefulWidget {
  final PlaceModel place;
  const PlaceDetailsWindow({super.key, required this.place});

  @override
  State<PlaceDetailsWindow> createState() => _PlaceDetailsWindowState();
}

class _PlaceDetailsWindowState extends State<PlaceDetailsWindow> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: Container(
        height: 500,
        constraints: BoxConstraints(
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
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  WindowImage(
                    imageUrl: widget.place.imageUrl,
                    location: widget.place.location,
                    isFavorite: isFavorite,
                    onFavorite: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${widget.place.location.latitude} ${widget.place.location.longitude}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    widget.place.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.place.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
