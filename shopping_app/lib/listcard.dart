import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/details_screen.dart';
import 'package:shopping_app/variable.dart';
import 'package:shopping_app/list_items.dart';

class CardItem extends StatefulWidget {
  const CardItem({super.key});

  @override
  State<CardItem> createState() => _CardState();
}

class _CardState extends State<CardItem> {
  late String _selectedfilter;
  @override
  void initState() {
    _selectedfilter = filters[0];
    super.initState();
  }

  final List<String> filters = ['All', 'Nike', 'Addidas', 'Bata'];
  final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(50));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Shoes\ncollection',
                    style: GoogleFonts.lato(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          hintStyle: const TextStyle(),
                          enabledBorder: border,
                          focusedBorder: border),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedfilter = filter;
                            });
                          },
                          child: Chip(
                            backgroundColor: _selectedfilter == filter
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            label: Text(
                              filters[index],
                              style: GoogleFonts.lato(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      DetailsScreen(product: products[index])));
                        },
                        child: ListProduct(
                            text: product['title'] as String,
                            amount: product['price'] as double,
                            background: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 260, 1),
                            image: product['imageUrl'] as String),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
