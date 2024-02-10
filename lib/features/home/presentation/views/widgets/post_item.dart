import 'package:flutter/material.dart';
import 'package:social_media_app/core/components/custom_sperator.dart';


class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
  });

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
                      const Row(
                        children: [
                          Text(
                            'Karim Ahmed',
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Text(
                        '23/10/2022',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete_rounded))
                ],
              ),
            ),
            const CustomSperator(),
            Row(
              children: [
                Text(
                  'Hello World',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://img.freepik.com/premium-photo/giant-mountains-with-snow-green-valley-with-meadow-forest-sunny-day_102332-806.jpg?size=626&ext=jpg'),
                    )),
              ),
            ),
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