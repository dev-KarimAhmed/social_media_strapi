import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/components/custom_appBar.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_state.dart';

import '../../../post/presentation/views/new_post_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, SocialMediaUiState>(
      listener: (context, state) {
        if (state is NewPost) {
          //when click to post 
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NewPostScreen()));
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: customAppBar(
              title: cubit.title[cubit.currentIndex], context: context),
          body: cubit.screens[cubit.currentIndex],
          //Navigation bar 
          bottomNavigationBar: BottomNavigationBar(
              fixedColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: const[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.upload_file), label: 'Post'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Users'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ]),
        );
      
      },
    );
  }
}
