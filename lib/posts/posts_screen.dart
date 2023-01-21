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
    return
    // SafeArea(
      // child: Scaffold(
        // appBar: getAppBar(),
        // body:
         const PostsScreenBody()
        // bottomNavigationBar: BottomNavigationBar(
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       label: "Inicio",
        //       icon: Icon(Icons.home_outlined),
        //     ),
        //     BottomNavigationBarItem(
        //       label: "Guardado",
        //       icon: Icon(Icons.save_alt_outlined),
        //     ),
        //     BottomNavigationBarItem(
        //       label: "Perfil",
        //       icon: Icon(Icons.person_outline),
        //     ),
        //   ],
        // ),
      // ),
    // )
    ;
  }

  AppBar getAppBar() {
    return AppBar(
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Image.asset('images/yb-icon.png'),
      ),
      leadingWidth: 70,
    );
  }
}

class PostsScreenBody extends StatelessWidget {
  const PostsScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostsProvider postsProvider =
        Provider.of<PostsProvider>(context, listen: false);
    PageController pageController = PageController(
      viewportFraction: 0.85,
    );
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Ultimas novedades', style: theme.textTheme.headline1),
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
                    final Post post = posts[index];
                    final String date = getFormattedDate(post.date!);
                    final bool isLast = posts.length - 1 == index;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetailScreen(post: post),
                          ),
                        );
                      },
                      child: Container(
                        padding: isLast
                            ? const EdgeInsets.symmetric(horizontal: 20)
                            : const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              child: LimitedBox(
                                maxHeight: 190,
                                child: Image.network(
                                  post.embedded.wpFeaturedmedia.first.link,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const SizedBox(
                                          height: 190,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()));
                                    }
                                  },
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
                                      vertical: 8, horizontal: 0),
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
        Divider(
          height: 1,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: theme.colorScheme.tertiary,
        ),
        Expanded(child: Container())
      ],
    );
  }
}
