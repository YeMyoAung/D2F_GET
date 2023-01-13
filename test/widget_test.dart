// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;

class Parser {
  final String message, about, createdBy, github;

  Parser(this.message, this.about, this.createdBy, this.github);

  factory Parser.test(dynamic decode) => Parser(decode['message'],
      decode['about'], decode['createdBy'], decode['github']);
}

class Socail {
  final String id, description;
  final bool isActive;
  final DateTime published;
  final List pictures, tags;
  final Profile profile;
  final List<Like> like;
  final List<Share> share;
  final List<Comment> comment;

  Socail(
      this.id,
      this.description,
      this.isActive,
      this.published,
      this.pictures,
      this.tags,
      this.profile,
      this.like,
      this.share,
      this.comment);
}

class Profile {
  final String email, name, gender;

  Profile(this.email, this.name, this.gender);
}

class Like {
  final String id, name;

  Like(this.id, this.name);
}

class Share {
  final String id, name;

  Share(this.id, this.name);
}

class Comment {
  final String id, name, comment;

  Comment(this.id, this.name, this.comment);
}

void main() {
  test('Model Prase', () async {
    final response =
        await http.get(Uri.parse('https://www.thunderclient.com/welcome'));
    final decode = json.decode(response.body);
    final Parser parser = Parser.test(decode);
  });
}
