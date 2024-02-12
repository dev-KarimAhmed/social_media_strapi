import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_cubit.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_state.dart';
import 'package:social_media_app/features/home/presentation/views/widgets/post_item.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthentcationCubit, AuthentcationState>(
      builder: (context, state) {
        // AuthentcationCubit cubit = AuthentcationCubit.get(context);
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return state is AuthentcationSuccess
                ? PostItem(authModel: state.authModel)
                : const PostItem();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 6,
        );
      },
    );
  }
}
