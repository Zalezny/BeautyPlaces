import 'package:beauty_places/screens/widgets/window_image_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/maps_utils.dart';

class WindowImage extends StatelessWidget {
  final String imageUrl;
  final GeoPoint location;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const WindowImage({
    super.key,
    required this.imageUrl,
    required this.location,
    this.isFavorite = false,
    required this.onFavorite,
  });

  void _onShare() {
    Share.shareUri(MapUtils.uri(location.latitude, location.longitude));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: double.infinity,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
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
                child: Row(
                  children: [
                    WindowImageIcon(
                      onIconTap: onFavorite,
                      icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    WindowImageIcon(
                      onIconTap: _onShare,
                      icon: Icons.share,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        errorWidget: (context, error, stackTrace) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('lib/assets/images/coffee.png'),
              Positioned(
                bottom: 0,
                right: 0,
                child: Row(
                  children: [
                    WindowImageIcon(
                      onIconTap: onFavorite,
                      icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    WindowImageIcon(
                      onIconTap: _onShare,
                      icon: Icons.share,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
