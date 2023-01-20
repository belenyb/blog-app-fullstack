import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:naked/posts/post_detail_screen.dart';
import 'package:provider/provider.dart';

import '../utils/date_formatter.dart';
import 'post_model.dart';
import 'posts_provider.dart';

class PostsScreen extends StatelessWidget {
  static const routeName = 'PostsScreen';
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostsProvider postsProvider = Provider.of<PostsProvider>(context, listen: false);
    PageController pageController = PageController(
      viewportFraction: 0.85,
    );
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset('images/yb-icon.png'),
          ),
          leadingWidth: 70,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child:
                  Text('Ultimas novedades', style: theme.textTheme.headline1),
            ),
            Expanded(
              child: FutureBuilder(
                future: postsProvider.getPosts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final posts = snapshot.data;
                    return PageView.builder(
                      controller: pageController,
                      padEnds: false,
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(posts.length);
                        final Post post = posts[index];
                        final String date = getFormattedDate(post.date!);
                        final bool isLast = posts.length - 1 == index;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PostDetailScreen(post: post),
                              ),
                            );
                          },
                          child: Container(
                            padding: isLast
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  child: LimitedBox(
                                    maxHeight: 190,
                                    child: Image.network(
                                      post.embedded.wpFeaturedmedia.first.link,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Html(
                                  data: post.title.rendered,
                                  style: {
                                    '*': Style(
                                      fontSize: const FontSize(18),
                                      fontWeight: FontWeight.w700,
                                      margin: EdgeInsets.zero,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                    ),
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.person_outline,
                                              size: 18),
                                          const SizedBox(width: 4),
                                          Text(
                                            post.embedded.author!.first.name!,
                                            style: theme.textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      date,
                                      style: theme.textTheme.caption,
                                    ),
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
                                // Html(data: post.content.rendered),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
