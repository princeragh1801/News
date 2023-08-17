import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/widget/spinkit.dart';

import '../models/category_news_model.dart';
import '../screen/category_news_detail.dart';
import '../veiw/category_view_model.dart';

class CategoryItemList extends StatelessWidget {
  const CategoryItemList(
      {super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    CategoryViewModel categoryViewModel = CategoryViewModel();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final format = DateFormat('MMMM dd, yyyy');
    return Expanded(
      child: FutureBuilder<CategoryNewsModel>(
          future:
              categoryViewModel.fetchNewsCategoryApi(category.toLowerCase()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Spinkit());
            }
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
              DateTime dateTime = DateTime.parse(
                  snapshot.data!.articles![index].publishedAt.toString());
              return InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryNewsDetailscreen(articles: snapshot.data!.articles![index],))),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  height: height * .20,
                  width: width * 0.5,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Card(
                    elevation: 5,
                    child: Row(children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: SizedBox(
                          width: width * .3,
                          height: height,
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
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: width * .55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data!.articles![index].title.toString(),
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width*0.25,
                                  child: Text(
                                    snapshot.data!.articles![index].source!.name
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                
                                SizedBox(
                                  width: width*.3,
                                  child: Text(
                                    format.format(dateTime),
                                    
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              );
            });
          }),
    );
  }
}
