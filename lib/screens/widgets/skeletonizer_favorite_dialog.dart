import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerFavoriteDialog extends StatelessWidget {
  const SkeletonizerFavoriteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListTile(
        leading: CircleAvatar(
          child: ClipOval(
              child: SizedBox.fromSize(
                  size: const Size.fromRadius(48),
                  child: CachedNetworkImage(
                    imageUrl: '',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      'lib/assets/images/coffee.png',
                      fit: BoxFit.cover,
                    ),
                  ))),
        ),
        title: const Text('Warszawka'),
        subtitle: const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec odio nec nunc.',
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
        trailing: const IconButton(
          onPressed: null,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
