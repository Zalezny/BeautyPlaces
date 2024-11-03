import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/screens/widgets/comment_section.dart';
import 'package:beauty_places/screens/widgets/window_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit/map_cubit.dart';

class PlaceDetailsWindow extends StatefulWidget {
  final PlaceModel place;
  const PlaceDetailsWindow({super.key, required this.place});

  @override
  State<PlaceDetailsWindow> createState() => _PlaceDetailsWindowState();
}

class _PlaceDetailsWindowState extends State<PlaceDetailsWindow> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = context.read<MapCubit>().containsFavorite(widget.place.uuid!);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: Container(
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
                      context.read<MapCubit>().changeFavorite(widget.place.uuid!);
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
                  const SizedBox(height: 10),
                  BlocBuilder<MapCubit, MapState>(
                    builder: (context, state) {
                      return CommentSection(
                        comments: state.models!.firstWhere((element) => element.uuid == widget.place.uuid).comments,
                        placeUuid: widget.place.uuid!,
                      );
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
