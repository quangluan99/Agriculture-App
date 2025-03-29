import 'package:agriculture_app/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:agriculture_app/models/product.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({super.key, required this.product});
  final AgroProduct product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ProductDetailsPage(
              product: product,
            );
          },
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        elevation: 20,
        child: Column(
          children: [
            Hero(
              tag: product.image,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topRight,
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.zero),
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border)),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$ ${product.price}',
                              style: const TextStyle(
                                  letterSpacing: -2,
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
                                text: '/kg ',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
