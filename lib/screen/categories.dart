import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../widget/category_item_list.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final format = DateFormat('MMMM dd, yyyy');
  String category = 'general';
  Color selectedColor = Colors.blueGrey;
  List<String> selectedCategory = [
    'General',
    'Sports',
    'Entertainment',
    'Health',
    'Business',
    'Technology'
  ];
  Widget buildCategory(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          category = selectedCategory[index];
        });
      },
      splashColor: Colors.grey,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: category == selectedCategory[index]
              ? Colors.blue
              : Colors.blueGrey,
        ),
        child: Text(
          selectedCategory[index],
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, category);
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Categories'),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 40,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return buildCategory(index);
                    },
                    itemCount: selectedCategory.length,
                  ),
                ),
              ),
              CategoryItemList(category: category),
            ],
          )),
    );
  }
}
