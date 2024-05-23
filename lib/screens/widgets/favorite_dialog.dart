import 'package:beauty_places/bloc/cubit/map_cubit.dart';
import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/screens/widgets/skeletonizer_favorite_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteDialog extends StatelessWidget {
  final Function(PlaceModel) onFavoriteChosen;

  const FavoriteDialog({super.key, required this.onFavoriteChosen});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
            ),
            BlocBuilder<MapCubit, MapState>(
              builder: (context, state) {
                if (state.models == null) {
                  return const SkeletonizerFavoriteDialog();
                }
                return Column(
                  children: state.favorite.map((e) {
                    final index = state.models?.indexWhere((element) => element.uuid == e);
                    if (index == null || index < 0) return const SizedBox();
                    final model = state.models![index];

                    return GestureDetector(
                      onTap: () {
                        onFavoriteChosen(model);
                        Navigator.of(context).pop();
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          child: ClipOval(
                              child: SizedBox.fromSize(
                                  size: const Size.fromRadius(48),
                                  child: CachedNetworkImage(
                                    imageUrl: model.imageUrl,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) => Image.asset(
                                      'lib/assets/images/coffee.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ))),
                        ),
                        title: Text(model.title),
                        subtitle: Text(
                          model.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<MapCubit>().changeFavorite(model.uuid!);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            )
          ],
        )),
      ),
    );
  }
}
