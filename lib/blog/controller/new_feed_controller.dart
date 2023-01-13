import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Post {
  final String author, description, image;
  const Post({
    required this.author,
    required this.description,
    required this.image,
  });
}

class NewFeedController extends GetxController {
  final List<Post> posts = [];

  final TextEditingController author = TextEditingController(),
      description = TextEditingController(),
      image = TextEditingController();

  @override
  void onClose() {
    author.dispose();
    description.dispose();
    image.dispose();
    super.onClose();
  }

  void create() {
    author.text = '';
    description.text = '';
    image.text = '';

    Get.bottomSheet(Container(
      color: Colors.white,
      child: Column(
        children: [
          TextField(
            controller: author,
            decoration: const InputDecoration(hintText: 'Author Name'),
          ),
          TextField(
            controller: description,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
          ),
          TextField(
            controller: image,
            decoration: const InputDecoration(
              hintText: 'Image',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Get.back();
                posts.add(
                  Post(
                      author: author.text,
                      description: description.text,
                      image: image.text),
                );
                update(['fjakjfldsa ewro23 p']);
              },
              child: const Text("Post"))
        ],
      ),
    ));
  }

  void edit(int index) {
    author.text = posts[index].author;
    description.text = posts[index].description;
    image.text = posts[index].image;

    Get.bottomSheet(Container(
      color: Colors.white,
      child: Column(
        children: [
          TextField(
            controller: author,
            decoration: const InputDecoration(hintText: 'Author Name'),
          ),
          TextField(
            controller: description,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
          ),
          TextField(
            controller: image,
            decoration: const InputDecoration(
              hintText: 'Image',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              posts[index] = Post(
                  author: author.text,
                  description: description.text,
                  image: image.text);
              update(['fjakjfldsa ewro23 p']);
            },
            child: const Text("Post"),
          )
        ],
      ),
    ));
  }

  void delete(int index) {
    posts.removeAt(index);
    update(['fjakjfldsa ewro23 p']);
  }
}
