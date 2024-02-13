// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:social_media_app/features/home/data/models/post_model/post_model.dart';

abstract class HomeStates {}

class HomeStatesIntial extends HomeStates {}

class PasswordHideen extends HomeStates {}

class LoadingState extends HomeStates {}

class SuccessState extends HomeStates {
  final String uId;

  SuccessState(this.uId);
}

class FailureState extends HomeStates {}

class CreateUserSuccess extends HomeStates {}

class CreateUserFailure extends HomeStates {
  final String error;

  CreateUserFailure(this.error);
}

class GetDataLoadingState extends HomeStates {}

class GetDataSuccessState extends HomeStates {}

class GetDataFailureState extends HomeStates {
  final String error;

  GetDataFailureState(this.error);
}

class ChangeNavBottom extends HomeStates {}

class NewPost extends HomeStates {}

class ProfileImagePickedSuccess extends HomeStates {}

class ProfileImagePickedError extends HomeStates {}

class CoverImagePickedSuccess extends HomeStates {}

class CoverImagePickedError extends HomeStates {}

class ProfileImageSuccessUpload extends HomeStates {}

class ProfileImageErrorUpload extends HomeStates {}

class CoverImageSuccessUpload extends HomeStates {}

class CoverImageErrorUpload extends HomeStates {}

class UpdateDataError extends HomeStates {}

class UpdateDataSuccess extends HomeStates {}

class UpdateDataLoading extends HomeStates {}

class PostCreateLoading extends HomeStates {}

class PostCreateSuccess extends HomeStates {}

class PostCreateError extends HomeStates {}

class PostImagePickedSuccess extends HomeStates {}

class PostImagePickedRemoveSuccess extends HomeStates {}

// class GetPostsSuccess extends HomeStates {}

class GetPostsError extends HomeStates {
  final String error;

  GetPostsError(this.error);
}

class LikeSuccess extends HomeStates {}

class LikeError extends HomeStates {}

class GetUsersLoading extends HomeStates {}

class GetUsersSuccess extends HomeStates {}

class GetUsersError extends HomeStates {
  final String error;

  GetUsersError(this.error);
}

class SendMessageLoading extends HomeStates {}

class SendMessageSuccess extends HomeStates {}

class SendMessageError extends HomeStates {
  final String error;

  SendMessageError(this.error);
}

class GetMessagesSuccess extends HomeStates {}

class GetMessagesLoading extends HomeStates {}

class PostDeletedLoading extends HomeStates {}

class PostDeletedSuccess extends HomeStates {}

class PostDeletedError extends HomeStates {}

class GetPostsLoading extends HomeStates {}

class GetPostesFailed extends HomeStates {
  final String errMessage;

  GetPostesFailed(this.errMessage);
}

class GetPostesSuccess extends HomeStates {
  PostModel posts;

  GetPostesSuccess(this.posts);
}

class PostDeleteLoading extends HomeStates {}

class PostDeleteError extends HomeStates {
  final String errMessage;

  PostDeleteError(this.errMessage);
}

class PostDeleteSuccess extends HomeStates {}

class PostedSuccess extends HomeStates {}
class PostedLoading extends HomeStates {}
class PostedError extends HomeStates {
  String errMessage;
  PostedError({
    required this.errMessage,
  });
  
}
