import 'package:book_store_main/book_details.dart';
import 'package:flutter/material.dart';

class Recommendation extends StatefulWidget {
  const Recommendation(
      {super.key, required this.bookTitle, required this.images});

  final List bookTitle;
  final List images;

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookDetails(
                        path: widget.images[index],
                        title: widget.bookTitle[index]),
                  ),
                );
              },
              child: Container(
                width: 150,
                decoration: const BoxDecoration(),
                child: Column(children: [
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(
                              widget.images[index],
                            ),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 4.0,
                              offset: const Offset(0, 10)),
                        ]),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    widget.bookTitle[index],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
