import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/blog/controller/new_feed_controller.dart';

class NewFeedScreen extends StatelessWidget {
  const NewFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NewFeedController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Feeds"),
      ),
      body: GetBuilder<NewFeedController>(
          id: 'fjakjfldsa ewro23 p',
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.posts.length,
              itemBuilder: (_, i) {
                return ListTile(
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.find<NewFeedController>().edit(i);
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              Get.find<NewFeedController>().delete(i);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                  title: Text(
                    controller.posts[i].author,
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<NewFeedController>().create();
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
