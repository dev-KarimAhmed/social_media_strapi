import 'package:flutter/material.dart';
import 'package:social_media_app/features/home/presentation/views/widgets/post_item.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const PostItem(),
      separatorBuilder: (context, index) =>
          const SizedBox(height: 10),
      itemCount: 6,
    );
  }
}
