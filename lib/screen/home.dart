import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screen/categories.dart';
import 'package:news_app/veiw/news_veiw_model.dart';
import 'package:news_app/widget/popup_menu.dart';
import 'package:news_app/widget/top_headlines.dart';

import '../widget/category_item_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String category = 'General';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              var res = await Navigator.of(context).push(
                  MaterialPageRoute<String>(
                      builder: (context) => const CategoriesScreen()));
              setState(() {

                category = res.toString();
              });
              print(category);
            },
            icon: Image.asset(
              'assets/images/category_icon.png',
              height: 20,
              width: 30,
            )),
        actions: [
          Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const PopUpMenu())
        ],
        title: Text(
          'News App',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          children: [
            // TopHeadlines
            SizedBox(
              height: height * 0.5,
              width: width * .8,
              child: const TopHeadlines(),
            ),

            Container(
                margin: const EdgeInsets.only(top: 10),
                height: height,
                child: CategoryItemList(category: category.toLowerCase())),
          ]),
    );
  }
}
