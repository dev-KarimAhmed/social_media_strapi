import 'package:flutter/material.dart';
import 'package:social_media_app/features/home/presentation/views/widgets/post_listview.dart';

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const[
          // state is AuthentcationSuccess
          //     ? CommunicationCard(
          //         authModel: state.authModel,
          //       )
          //     : const SizedBox(),
          PostsListView(),
        ],
      ),
    );
  }
}
