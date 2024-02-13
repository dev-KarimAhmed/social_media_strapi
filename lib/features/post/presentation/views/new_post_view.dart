import 'package:flutter/material.dart';
import 'package:social_media_app/core/components/custom_actionBtn.dart';
import 'package:social_media_app/core/components/custom_circleAvatr.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});
  final TextEditingController postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Add Post', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          CustomActionButton(
            text: 'POST',
            onTap: () {},
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
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg?size=626&ext=jpg'),
                        ),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomCircleAvatar(
                      icon: Icons.close,
                      onPressed: () {
                        // HomeCubit.get(context).removePostImage();
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
                      onPressed: () {},
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
  }
}
