import 'package:beauty_places/data/models/place_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
            child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 400,
                  maxWidth: double.infinity,
                ),
                child: CachedNetworkImage(
                  imageUrl: place.imageUrl,
                  width: double.infinity,
                  errorWidget: (context, error, stackTrace) {
                    return Image.asset('lib/assets/images/coffee.png');
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                place.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  place.description,
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
