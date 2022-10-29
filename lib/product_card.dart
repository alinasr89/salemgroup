import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.count,
  }) : super(key: key);
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String imageUrl;
  final num? rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 325,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 10.0,
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                        Row(children: [
                          Text('Category: $category'),
                          const Spacer(),
                          Text(
                            'US\$$price',
                            style: const TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                          )
                        ]),
                        Row(
                          children: [
                            RatingBar.builder(
                              itemSize: 20,
                              allowHalfRating: true,
                              initialRating:
                                  rating!.toDouble(), //Rating from API
                              ignoreGestures: true,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemPadding: const EdgeInsets.all(4),
                              onRatingUpdate: (val) {},
                              //Maybe we can use it later
                            ),
                            const Spacer(),
                            Text(
                              '$count',
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            )));
  }
}
