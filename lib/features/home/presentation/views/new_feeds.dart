import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/views/widgets/communication_card.dart';
import 'package:social_media_app/features/home/presentation/views/widgets/post_listview.dart';

import '../view_model/home_cubit/home_state.dart';

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, SocialMediaUiState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            children:const [
              CommunicationCard(),
              PostsListView(),
            ],
          ),
        );
      },
    );
  }
}


