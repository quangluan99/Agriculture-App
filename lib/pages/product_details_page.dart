import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/models/service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final AgroProduct product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 0;
  void addQuantity() {
    setState(() {
      quantity++;
    });
  }

  void removeQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  bool showMore = false;

  late TapGestureRecognizer readMoreGestureRecognizer;

  @override
  void initState() {
    readMoreGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showMore = !showMore;
        });
      };
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    readMoreGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Details',
            style: textTheme.titleLarge,
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(IconlyBroken.bookmark))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            SizedBox(
              height: 240,
              width: double.infinity,
              child: Image.network(
                widget.product.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              widget.product.name,
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  'Availlable in Stock',
                  style: textTheme.bodyMedium!.copyWith(
                      color: Colors.green, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '\$${widget.product.price}/',
                      style: textTheme.bodyLarge!.copyWith(
                        letterSpacing: -0.8,
                        fontWeight: FontWeight.w800,
                      )),
                  TextSpan(
                      text: widget.product.unit,
                      style:
                          textTheme.titleSmall!.copyWith(color: Colors.grey)),
                ])),
                const SizedBox(
                  width: 30.0,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  IconlyBold.star,
                  color: Colors.amber,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: ' ${widget.product.rating}',
                      style: textTheme.bodyMedium!.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: ' (${widget.product.reviews})',
                      style: textTheme.bodyMedium!.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w500))
                ])),
                const Spacer(),
                IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: removeQuantity,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    '$quantity ${widget.product.unit}',
                    style: textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: addQuantity,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Text(
              'Description',
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: showMore
                      ? '${widget.product.description}...'
                      : '${widget.product.description.substring(0, 80)}...',
                  style: textTheme.bodyMedium!.copyWith(color: Colors.grey)),
              TextSpan(
                  text: showMore ? 'Read less' : 'Read more',
                  recognizer: readMoreGestureRecognizer,
                  style: textTheme.bodyMedium!.copyWith(
                      color: Colors.green, fontWeight: FontWeight.w700))
            ])),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              'Related Products',
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: 90.0,
              height: 90.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: services.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Container(
                    width: 85.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: NetworkImage(service.image),
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton.icon(
                label: Text(
                  'Add to cart',
                  style: textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                onPressed: () {},
                icon: const Icon(
                  IconlyLight.bag2,
                  color: Colors.white,
                ))
          ],
        ));
  }
}
