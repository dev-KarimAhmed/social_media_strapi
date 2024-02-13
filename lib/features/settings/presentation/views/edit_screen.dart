import 'package:flutter/material.dart';
import 'package:social_media_app/core/components/custom_actionBtn.dart';
import 'package:social_media_app/core/components/custom_circleAvatr.dart';
import 'package:social_media_app/core/components/custom_textFormField.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            CustomActionButton(
              onTap: () {},
              text: 'Update',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // if(state is UpdateDataLoading)
                SizedBox(
                  height: 200,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 160,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://img.freepik.com/premium-photo/giant-mountains-with-snow-green-valley-with-meadow-forest-sunny-day_102332-806.jpg?size=626&ext=jpg'),
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomCircleAvatar(
                                icon: Icons.camera_alt_rounded,
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            radius: 54,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/premium-photo/giant-mountains-with-snow-green-valley-with-meadow-forest-sunny-day_102332-806.jpg?size=626&ext=jpg'),
                              radius: 50,
                            ),
                          ),
                          CustomCircleAvatar(
                            icon: Icons.camera_alt_rounded,
                            radius: 15,
                            size: 15,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          MaterialButton(
                            color: Colors.blue,
                            onPressed: () {},
                            child: const Text(
                              'UPLOAD PROFILE',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    children: [
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () {},
                        child: const Text(
                          'UPLOAD COVER',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        icon: Icons.person,
                        label: 'Name',
                        controller: nameController,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        icon: Icons.info,
                        label: 'Bio',
                        controller: bioController,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        icon: Icons.phone_android,
                        label: 'phone number',
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
