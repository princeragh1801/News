import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/screen/news_detail.dart';
import 'package:news_app/widget/spinkit.dart';

import '../models/news_channel_headline.dart';
import '../veiw/news_veiw_model.dart';

class TopHeadlines extends StatefulWidget {
  const TopHeadlines({super.key});

  @override
  State<TopHeadlines> createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MMMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder<NewsChannelsHeadlinesModel>(
        future: newsViewModel.fetchNewsChannelApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Spinkit());
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                DateTime dateTime = DateTime.parse(
                    snapshot.data!.articles![index].publishedAt.toString());
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>NewsDetailscreen(articles: snapshot.data!.articles![index]))
                  ),
                  
                  child: Stack(
                    alignment: Alignment.bottomCenter, children: [
                    Container(
                      height: height*0.6,
                      width: width*0.9,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .04,
                        vertical: height * .02,
                      ),
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data!.articles![index].urlToImage
                              .toString(),
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Spinkit(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    // headline 
                    Container(
                      height: height * 0.2,
                      width: width * 0.7,
                      margin: EdgeInsets.only(bottom: height * 0.05),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data!.articles![index].title.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.articles![index].source!.name
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 10, fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                                // minFontSize: 18,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(format.format(dateTime).toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                                // minFontSize: 18,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                );
              });
        });
  }
}
