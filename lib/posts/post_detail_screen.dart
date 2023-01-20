import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../utils/date_formatter.dart';
import 'post_model.dart';

class PostDetailScreen extends StatelessWidget {
  static const routeName = 'PostDetailScreen';
  final Post? post;

  const PostDetailScreen({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String date = getFormattedDate(post!.date!);
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          leadingWidth: 70,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.network(
                    post!.embedded.wpFeaturedmedia.first.link,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      label: Text('Categoria'),
                    ),
                    Expanded(child: Container()),
                    Text(
                      date,
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Html(
                  data: post!.title.rendered,
                  style: {
                    '*': Style(
                      fontSize: const FontSize(22),
                      fontWeight: FontWeight.w700,
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.person_outline, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            post!.embedded.author!.first.name!,
                            style: theme.textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    const Chip(
                      label: Icon(Icons.ios_share_outlined),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Html(
                  data: post!.content.rendered,
                  style: {
                    '*': Style(
                      fontSize: const FontSize(16),
                      fontWeight: FontWeight.w400,
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: theme.colorScheme.primary,
                      textDecoration: TextDecoration.none,
                      textAlign: TextAlign.justify,
                    ),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
