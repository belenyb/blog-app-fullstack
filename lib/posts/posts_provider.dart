import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'post_model.dart';

class PostsProvider extends ChangeNotifier {
  // /wp/v2/media?parent=<id>
  static const String baseUrl = 'https://demo.webwish.com.ar';
  List<Post> posts = [];

  Future<List<Post>> getPosts() async {
    const String endpoint = '/wp-json/wp/v2/posts';
    final Uri url = Uri.parse(baseUrl + endpoint);
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final resp = json.decode(response.body) as List;
        for (var element in resp) {
          final tempPost = Post.fromJson(element);
          posts.add(tempPost);
          // https://stackoverflow.com/questions/24994321/wordpress-wp-api-get-images-attached-to-post
        }
        return posts;
      } else {
        debugPrint(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
