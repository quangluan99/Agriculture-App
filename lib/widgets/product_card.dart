import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final AgroProduct product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ProductDetailsPage(product: product);
          },
        ));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(width: 0.9, color: Colors.green)),
        elevation: 10,
        shadowColor: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              width: double.infinity,
              height: 130.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.green.shade200),
                  onPressed: () {},
                  icon: const Icon(IconlyLight.bookmark)),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                product.name,
                style: textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '\$${product.price}/',
                        style: textTheme.titleMedium!.copyWith(
                            letterSpacing: -0.8, fontWeight: FontWeight.w800)),
                    TextSpan(
                        text: 'kg',
                        style:
                            textTheme.titleSmall!.copyWith(color: Colors.grey)),
                  ])),
                  const Spacer(),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      padding: const EdgeInsets.all(5),
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      onPressed: () {},
                      icon: const Icon(
                        size: 20.0,
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
