import 'package:flutter/material.dart';
import 'package:naked/posts/posts_provider.dart';
import 'package:provider/provider.dart';

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
        home: SafeArea(child: PostsScreen()),
      ),
    );
  }
}
