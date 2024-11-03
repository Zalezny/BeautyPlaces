import 'package:beauty_places/bloc/cubit/user_session_cubit.dart';
import 'package:beauty_places/data/models/comment_model.dart';
import 'package:beauty_places/screens/widgets/add_comment_section.dart';
import 'package:beauty_places/screens/widgets/comment_item.dart';
import 'package:flutter/material.dart';

import '../../services/injection.dart';

class CommentSection extends StatelessWidget {
  final String placeUuid;
  final List<CommentModel> comments;
  const CommentSection({
    super.key,
    required this.comments,
    required this.placeUuid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Komentarze (${comments.length})',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            ...comments.map((comment) => CommentItem(comment: comment)),
            if (!getIt<UserSessionCubit>().areYouComment(comments))
              AddCommentSection(
                placeUuid: placeUuid,
              ),
          ],
        ),
      ),
    );
  }
}
