import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/core/components/custom_sperator.dart';
import 'package:social_media_app/features/home/data/models/post_model/post_model.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    this.postModel,
    this.index,
    this.deleteFunction,
    this.reload,
  });
  final PostModel? postModel;
  final int? index;
  final void Function()? deleteFunction;
  final void Function()? reload;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg?size=626&ext=jpg'),
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            postModel?.data![index ?? 0].attributes?.user?.datum
                                    ?.userData?.username ??
                                'Anonymous',
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Text(
                        DateFormat('dd/M/yyyy hh:mm a').format(DateTime.parse(
                                '${postModel?.data![index ?? 0].attributes?.createdAt}')
                            .toLocal()),
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  )),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: const Text('Delete Post'),
                                      content: const Text(
                                          'Are you sure you want to delete this post?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: deleteFunction,
                                          child: const Text('Delete'),
                                        )
                                      ]);
                                });
                          },
                          icon: const Icon(Icons.delete_rounded)),
                      IconButton(
                          onPressed: reload,
                          icon: Icon(Icons.network_check_sharp))
                    ],
                  )
                ],
              ),
            ),
            const CustomSperator(),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Text(
                    postModel?.data![index ?? 0].attributes?.description ??
                        'Hello World',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            postModel?.data![index ?? 0].attributes?.image?.imageData
                        ?.attributes?.formats?.thumbnail?.url !=
                    null
                ? Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'http://192.168.1.5:1337${postModel?.data![index ?? 0].attributes?.image?.imageData?.attributes?.formats?.thumbnail?.url}'),
                          )),
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_circle_up,
                          color: Colors.green,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '56',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.message,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '0 comment',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/premium-photo/giant-mountains-with-snow-green-valley-with-meadow-forest-sunny-day_102332-806.jpg?size=626&ext=jpg'),
                          radius: 15,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'write a comment...',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.arrow_circle_up,
                            color: Colors.green,
                            size: 22,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'UP',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
