import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_cubit.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_state.dart';
import 'package:social_media_app/features/home/presentation/views/widgets/communication_card.dart';
import 'package:social_media_app/features/home/presentation/views/widgets/post_listview.dart';

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
