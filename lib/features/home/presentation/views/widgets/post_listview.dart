import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_cubit.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_state.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_state.dart';
import 'package:social_media_app/features/home/presentation/views/widgets/post_item.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return state is GetPostsLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return state is GetPostesSuccess
                      ? PostItem(
                          postModel: state.posts,
                          index: index,
                        )
                      : const PostItem();
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount:
                    state is GetPostesSuccess ? state.posts.data!.length : 0,
              );
      },
    );
  }
}
