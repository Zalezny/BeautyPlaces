import 'package:beauty_places/bloc/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toastification/toastification.dart';

import '../../bloc/cubit/user_session_cubit.dart';
import '../../services/injection.dart';
import '../../utils/validators.dart';

class AddCommentSection extends StatefulWidget {
  final String placeUuid;
  const AddCommentSection({super.key, required this.placeUuid});

  @override
  State<AddCommentSection> createState() => _AddCommentSectionState();
}

class _AddCommentSectionState extends State<AddCommentSection> {
  final _textController = TextEditingController();
  int rating = 5;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              controller: _textController,
              maxLines: 2,
              validator: Validators.validateNull,
              decoration: const InputDecoration(
                hintText: 'Napisz coś o tej lokalizacji...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Ocena:"),
                const SizedBox(width: 24),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: rating.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      this.rating = rating.toInt();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (getIt<UserSessionCubit>().state == const UserSessionState.notLogged()) {
                  toastification.show(
                    title: const Text('Musisz być zalogowany aby dodać komentarz'),
                    alignment: Alignment.bottomCenter,
                    type: ToastificationType.success,
                    autoCloseDuration: const Duration(seconds: 3),
                  );
                  return;
                }
                if (formKey.currentState!.validate()) {
                  context.read<MapCubit>().addComment(widget.placeUuid, _textController.text, rating);
                }
              },
              child: const Text('Dodaj komentarz'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
