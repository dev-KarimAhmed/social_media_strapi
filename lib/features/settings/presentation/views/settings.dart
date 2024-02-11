import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/constants.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_state.dart';
import 'package:social_media_app/startpoint.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, SocialMediaUiState>(
      listener: (context, state) {
        if (state is SignedOutSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const StartPoint()),
              (route) => true);
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 160,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg?size=626&ext=jpg'),
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8))),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 54,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg?size=626&ext=jpg'),
                          radius: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Karim Ahmed',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'bio.....',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              const Text('100'),
                              Text(
                                'Posts',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              const Text('265'),
                              Text(
                                'Photos',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              const Text('10k'),
                              Text(
                                'Followers',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              const Text('64'),
                              Text(
                                'Following',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Add photo',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cubit.signOut(token);
                        // token = null;
                        // print(token);
                        // GoRouter.of(context)
                        //     .pushReplacement(AppRouter.kLoginView);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
/**
 * Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/cheerful-young-men-plaid-blue-shirts-white-t-shirts-colorful-pants-pose-orange-wall-great-mood-smile_197531-23466.jpg?size=626&ext=jpg'),
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                    ),
                  ),
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/male-striped-coat-walking-field-with-tall-grass-near-sea_181624-3652.jpg?size=626&ext=jpg'),
                      radius: 50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Karim Ahmed',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'bio...',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text('100'),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text('100'),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text('100'),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text('100'),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text(
                'EDIT PROFILE',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              minWidth: double.infinity,
              height: 50,
            )
          ],
        ),
      ),
    );
  
 
 */