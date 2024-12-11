import 'package:beauty_places/data/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  comment.email!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                RatingBar.builder(
                  initialRating: comment.star.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const SizedBox(
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  onRatingUpdate: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              comment.content,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ));
  }
}
