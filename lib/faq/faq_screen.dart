import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import 'faq_model.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final Uri url = Uri.parse('https://nakedlunch.com.ar/wp-json/wp/v2/pages');
  bool isLoading = false;
  List<Faq> faqs = [];

  @override
  void initState() {
    super.initState();
    _fetchFaqs();
  }

  Future<void> _fetchFaqs() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final resp = json.decode(response.body) as List;
      for (var element in resp) {
        final tempFaq = Faq.fromJson(element);
        faqs.add(tempFaq);
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: faqs.length,
              itemBuilder: (BuildContext context, int index) {
                return Html(
                  data: faqs[index].content!.rendered,
                  customRender: {
                    "p": (context, parsedChild) {
                      return parsedChild;
                    },
                    "a": (context, parsedChild) {
                      return InkWell(
                        child: parsedChild,
                        onTap: () {
                          _launchUrl(parsedChild.toString());
                        },
                      );
                    }
                  },
                );
              },
            ),
    );
  }
}

Future<void> _launchUrl(url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}
