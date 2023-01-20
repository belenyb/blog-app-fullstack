import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'post_model.dart';

class PostsProvider extends ChangeNotifier {
  static const String baseUrl = 'https://demo.webwish.com.ar';
  List<Post> posts = [];

  Future<List<Post>> getPosts() async {
    const String slug = "?_embed";
    const String endpoint = '$baseUrl/wp-json/wp/v2/posts$slug';
    final endpointUrl = Uri.encodeFull(endpoint);
    final url = Uri.parse(endpointUrl);
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final resp = json.decode(response.body) as List;
        for (var element in resp) {
          final tempPost = Post.fromJson(element);
          posts.add(tempPost);
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
