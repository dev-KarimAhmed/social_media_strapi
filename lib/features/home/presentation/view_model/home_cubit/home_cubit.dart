import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_state.dart';


import '../../../../chat/presentation/views/chat_view.dart';
import '../../views/new_feeds.dart';
import '../../../../post/presentation/views/new_post_view.dart';
import '../../../../search/presentation/views/search.dart';
import '../../../../settings/presentation/views/settings.dart';

class AppCubit extends Cubit<SocialMediaUiState> {
  AppCubit() : super(SocialMediaUiInitial());
  static AppCubit get(context) => BlocProvider.of(context);


  // Function to hide password in the textField
  bool isHidden = true;
  void hidePassword() {
    isHidden = !isHidden;
    emit(PasswordHideen());
  }

  //Function to register the user for the first time when use application

  //Function to Login in

  //Function to create a user and / === intialize the model === /
 
  
  // variables for the navigationBar
  int currentIndex = 0;
  List<Widget> screens = [
   const NewsFeedView(),
  const  ChatView(),
    NewPostScreen(),
  const  SearchView(),
  const  SettingsView()
  ];
  List<String> title = ['Home', 'Chat', 'Add Post', 'Search', 'Settings'];

  // function to change screens in navigationBar
  void changeBottomNav(int index) {
    if (index == 1) {
     
    }

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


  // void updateUserImages(
  //     {required String name, required String bio, required String phone}) {
  //   emit(UpdateDataLoading());
  //   if (profileImage != null) {
  //     uploadProfileImage();
  //   } else if (profileImage != null) {
  //     uploadCoverImage();
  //   } else if (profileImage != null && profileImage != null) {
  //   } else {
  //     updateUserData(name: name, bio: bio, phone: phone);
  //   }
  // }

 
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
