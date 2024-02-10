import 'package:flutter/material.dart';


class ChatDetailsView extends StatelessWidget {
  ChatDetailsView({super.key});

  final TextEditingController messageController = TextEditingController();
  final ScrollController controller = ScrollController();

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
        titleSpacing: 0,
        title: Row(
          children: [
           const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/cute-cat-laying-grass_23-2150385852.jpg?size=626&ext=jpg'),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
               'someone',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Column(
          children: [
            
                 Expanded(
                    child: ListView.separated(
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const Text('Message');
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: 6,
                    ),
                  ),
               
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.withOpacity(.3),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: InputBorder.none,
                        hintText: 'Type your message here......',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.blue[300]),
                    child: IconButton(
                        onPressed: () {
                          if (messageController.text.isNotEmpty) {
                            controller.animateTo(
                              controller.position.maxScrollExtent,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            );
                          }
                          messageController.text = '';
                        },
                        icon: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                        )),
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


