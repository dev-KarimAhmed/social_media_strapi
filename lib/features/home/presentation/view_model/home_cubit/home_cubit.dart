import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/features/home/data/repos/home_repo.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_state.dart';

import '../../../../chat/presentation/views/chat_view.dart';
import '../../views/new_feeds.dart';
import '../../../../post/presentation/views/new_post_view.dart';
import '../../../../search/presentation/views/search.dart';
import '../../../../settings/presentation/views/settings.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(HomeStatesIntial());
  static HomeCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  // variables for the navigationBar
  int currentIndex = 0;
  List<Widget> screens = [
    const NewsFeedView(),
    const ChatView(),
    NewPostScreen(),
    const SearchView(),
    const SettingsView()
  ];
  List<String> title = ['Home', 'Chat', 'Add Post', 'Search', 'Settings'];

  // function to change screens in navigationBar
  void changeBottomNav(int index) {
    if (index == 1) {}

    if (index == 2) {
      emit(NewPost());
    } else {
      currentIndex = index;
      emit(ChangeNavBottom());
    }
  }

  // Function to pick an image from your gallery for profile (imagePicker package)
  File? profileImage;
  Future pickedImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      profileImage = File(returnImage.path);
    } else {
      return;
    }
    emit(ProfileImagePickedSuccess());
  }

  // Function to pick an image from your gallery for cover (imagePicker package)
  File? coverImage;
  Future pickedImageCoverFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage != null) {
      coverImage = File(returnImage.path);
    } else {
      return;
    }

    emit(CoverImagePickedSuccess());
  }

  Future<void> getPosts() async {
    emit(GetPostsLoading());

    var result = await homeRepo.getPosts();

    result.fold(
      (failure) => emit(GetPostesFailed(failure.errMessage)),
      (posts) => emit(GetPostesSuccess(posts)),
    );
  }

  // Function to pick an image from your gallery for post (imagePicker package)
  File? postImage;
  Future pickedPostImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage != null) {
      postImage = File(returnImage.path);
    } else {
      return;
    }

    emit(PostImagePickedSuccess());
  }

  //Function to remove the post image
  void removePostImage() {
    postImage = null;
    emit(PostImagePickedRemoveSuccess());
  }

  // Fucntion to upload the post image in the storage of Firebase
}
