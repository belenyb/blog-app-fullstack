import 'package:flutter/material.dart';
import 'package:naked/posts/posts_provider.dart';
import 'package:provider/provider.dart';

import 'layout.dart';
import 'my_theme.dart';
import 'posts/post_detail_screen.dart';
import 'posts/posts_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostsProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: myTheme(),
        routes: {
          PostsScreen.routeName: (context) => const PostsScreen(),
          PostDetailScreen.routeName: (context) => const PostDetailScreen(),
          Layout.routeName: (context) => const Layout(),
        },
        initialRoute: Layout.routeName,
      ),
    );
  }
}
