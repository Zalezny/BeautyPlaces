import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/utils/maps_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PlaceDetailsWindow extends StatelessWidget {
  final PlaceModel place;
  const PlaceDetailsWindow({super.key, required this.place});
  

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
                  Container(
                    constraints: const BoxConstraints(
                      maxHeight: 300,
                      maxWidth: double.infinity,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: place.imageUrl,
                      width: double.infinity,
                      imageBuilder: (context, imageProvider) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  Share.shareUri(MapUtils.uri(place.location.latitude, place.location.longitude));
                                },
                                child: Container(
                                  color: Colors.blue.withOpacity(0.6),
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  child: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      errorWidget: (context, error, stackTrace) {
                        return Image.asset('lib/assets/images/coffee.png');
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${place.location.latitude} ${place.location.longitude}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
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
