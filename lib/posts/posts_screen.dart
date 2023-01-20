import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import 'post_model.dart';
import 'posts_provider.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostsProvider postsProvider = Provider.of<PostsProvider>(context);
    PageController pageController = PageController(
      viewportFraction: 0.8,
    );

    return Scaffold(
      body: FutureBuilder(
        future: postsProvider.getPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final posts = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Ultimas novedades'),
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    padEnds: false,
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Post post = posts[index];
                      final String author = post.author.toString();
                      final String date = getFormattedDate(post.date!);
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text('Por: $author')),
                              Text(date),
                            ],
                          ),
                          post.tags.isEmpty
                              ? const SizedBox()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: post.tags.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [Text(post.tags[index])],
                                    );
                                  },
                                ),
                          Html(data: post.title.rendered),
                          Html(data: post.content.rendered),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

getFormattedDate(DateTime date, {bool includeYear = false}) {
  List<String> months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];
  final splittedDate = date.toIso8601String().split('T').first;
  final year = splittedDate.split('-').first;
  final month = months.elementAt(int.parse(splittedDate.split('-')[1]));
  final day = splittedDate.split('-')[2];

  return includeYear ? "$day $month $year" : "$day $month";
}
