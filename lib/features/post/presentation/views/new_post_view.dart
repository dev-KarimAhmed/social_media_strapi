import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/components/check_if_image_null_function.dart';
import 'package:social_media_app/core/components/custom_actionBtn.dart';
import 'package:social_media_app/core/components/custom_circleAvatr.dart';
import 'package:social_media_app/core/utils/services_locator.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_cubit.dart';
import 'package:social_media_app/features/home/data/repos/home_repo_impl.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_state.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});
  final TextEditingController postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepoImpl>()),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {

          if (state is AddPostSuccess) {
            postController.clear();
            HomeCubit.get(context).removePostImage();
            postController.clear();
            back(context);
          }
          if (state is AddPostError) {
            print(state.errMessage);
          }
          
        },
        builder: (context, state) {
          AuthentcationCubit cubit = AuthentcationCubit.get(context);
          return state is AddPostLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 0,
                    title: Text('Add Post',
                        style: Theme.of(context).textTheme.titleLarge),
                    actions: [
                      CustomActionButton(
                        text: 'POST',
                        onTap: () {
                          HomeCubit.get(context).addPost(
                            token: cubit.getToken()[0],
                            name: cubit.getToken()[1],
                            description: postController.text,
                            user: cubit.getToken()[2].toString(),
                            image: HomeCubit.get(context).postImage,
                          );
                          // var header = {
                          //   'Authorization': 'Bearer ${cubit.getToken()[0]}'
                          // };
                          // Response responsee;
                          // Dio dio = Dio();
                          // responsee = await dio.post(
                          //   'http://192.168.1.5:1337/api/posts',
                          //   data: await addPostData(
                          //     image: HomeCubit.get(context).postImage,
                          //     description: postController.text,
                          //     name: cubit.getToken()[1],
                          //     user: cubit.getToken()[2].toString(),
                          //   ),
                          //   options: Options(headers: header),
                          // );
                          // print('Response data: ${responsee.data}');
                          // HomeCubit.get(context).createPost(
                          //   token: cubit.getToken()[0],
                          //   apiData: {
                          //     'data': {
                          //       "name": "Without name , remove it from api",
                          //       "description": postController.text,
                          //       "User": cubit.getToken()[2],
                          //     }
                          //   },
                          // );
                          // HomeCubit.get(context).postImage != null
                          //     ? HomeCubit.get(context).uploadPostImage(
                          //         token: cubit.getToken()[0],
                          //         postImageData: {
                          //           "refId": HomeCubit.get(context)
                          //               .postPostModel
                          //               ?.data
                          //               ?.id,
                          //           "ref": "api::post.post",
                          //           "field": "image",
                          //           "file": HomeCubit.get(context).postImage
                          //         },
                          //       )
                          //     : print('No image');
                        },
                      ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const LinearProgressIndicator(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://img.freepik.com/free-photo/male-striped-coat-walking-field-with-tall-grass-near-sea_181624-3652.jpg?size=626&ext=jpg'),
                                radius: 20,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(cubit.getToken()[1]),
                            ],
                          ),
                          SizedBox(
                            height: 200,
                            child: TextFormField(
                              controller: postController,
                              maxLength: 300,
                              minLines: 1,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                hintText: 'What is on your mind',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: postImageUploadIfNull(
                                          HomeCubit.get(context).postImage),
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomCircleAvatar(
                                  icon: Icons.close,
                                  onPressed: () {
                                    HomeCubit.get(context).removePostImage();
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 200,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    HomeCubit.get(context)
                                        .pickedPostImageFromGallery();
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.photo_library_outlined),
                                      SizedBox(width: 10),
                                      Text('Add photo')
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text('# tags'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  void back(BuildContext context) => Navigator.pop(context);
}

Future<FormData> addPostData({
  required File? image,
  required String description,
  required String name,
  required String user,
}) async {
  var formData = FormData();
  formData.fields.add(MapEntry("data",
      '{"name" : "$name" , "description" : "$description" , "User" : "$user"}'));
  if (image != null) {
    formData.files.add(MapEntry(
        "files.image",
        await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last)));
  }
  return formData;
}
