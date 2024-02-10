import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/components/custom_actionBtn.dart';
import 'package:social_media_app/core/components/custom_circleAvatr.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_state.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});
  final TextEditingController postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, SocialMediaUiState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                AppCubit.get(context).removePostImage();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            title:
                Text('Add Post', style: Theme.of(context).textTheme.titleLarge),
            actions: [
              CustomActionButton(
                text: 'POST',
                onTap: () {
                 
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  if (state is PostCreateLoading) ...[
                    const LinearProgressIndicator(),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/male-striped-coat-walking-field-with-tall-grass-near-sea_181624-3652.jpg?size=626&ext=jpg'),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Karim Ahmed'),
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
                  if (AppCubit.get(context).postImage != null) ...[
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    FileImage(AppCubit.get(context).postImage!),
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomCircleAvatar(
                            icon: Icons.close,
                            onPressed: () {
                              AppCubit.get(context).removePostImage();
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            AppCubit.get(context).pickedPostImageFromGallery();
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
    );
  }
}
