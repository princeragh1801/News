import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_channel_headline.dart';

import '../widget/spinkit.dart';

class NewsDetailscreen extends StatelessWidget {
  const NewsDetailscreen({super.key, required this.articles});
  final Articles articles;

  Widget textBuilder(String str, double size) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        str,
        style: GoogleFonts.poppins(fontSize: size, fontWeight: FontWeight.bold,),
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
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: height * 0.4,
          width: width,
          child: CachedNetworkImage(
            imageUrl: articles.urlToImage.toString(),
            fit: BoxFit.cover,
            placeholder: (context, url) => const Spinkit(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
       
        textBuilder(articles.title.toString(), 15),
        textBuilder( format.format(dateTime).toString(), 10),
      
        textBuilder('Description', 15),
        textBuilder(articles.description.toString(), 10),
        
        textBuilder('Content', 15),
        textBuilder(articles.content.toString(), 10),
        TextButton(onPressed: (){
          // Navigator.of(context).
        }, child: const Text('Read content'))
        
      ]),
    );
  }
}
