import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/category_news_model.dart';

import '../widget/spinkit.dart';

class CategoryNewsDetailscreen extends StatelessWidget {
  const CategoryNewsDetailscreen({super.key, required this.articles});
  final  Articles articles;

  Widget textBuilder(String str, double size) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        str,
        style: GoogleFonts.poppins(fontSize: size, fontWeight: FontWeight.bold),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final format = DateFormat('MMMM dd, yyyy');
    DateTime dateTime = DateTime.parse(articles.publishedAt.toString());
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Read Full Article',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          height: height * 0.4,
          width: width,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage.toString(),
              fit: BoxFit.cover,
              placeholder: (context, url) => const Spinkit(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      textBuilder(articles.title.toString(), 15),
      textBuilder( format.format(dateTime).toString(), 10),
      
      textBuilder('Description', 15),
      textBuilder(articles.description.toString(), 10),
      
      textBuilder('Content', 15),
      textBuilder(articles.content.toString(), 10),
      ]),
    );
  }
}
