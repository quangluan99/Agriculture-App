import 'package:agriculture_app/models/product.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final AgroProduct product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int count = 1;
  bool showMORE = false;
  late TapGestureRecognizer gestureRecognizer;

  @override
  void initState() {
    gestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showMORE = !showMORE;
        });
      };
    super.initState();
  }

  @override
  void dispose() {
    gestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        children: [
          Hero(
            tag: widget.product.image,
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            widget.product.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Row(
            children: [
              const Text(
                'Available in stork ',
                style: TextStyle(color: Colors.green, fontSize: 15.0),
              ),
              const Spacer(),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: '\$ ${widget.product.price}',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text: '/kg',
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold))
                ]),
              )
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(
                '${widget.product.rating}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 3.5,
              ),
              Text('(${widget.product.reviews})'),
              const Spacer(),
              SizedBox(
                height: 25,
                width: 25,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    setState(() {
                      if (count > 0) {
                        count--;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 15.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  '$count ${widget.product.unit}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
                width: 25,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 15.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          RichText(
            text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black54,
                ),
                children: [
                  TextSpan(
                    text: showMORE == true
                        ? widget.product.description
                        : widget.product.description.substring(
                            0, widget.product.description.length - 100),
                  ),
                  TextSpan(
                    text: showMORE == true ? "Read less" : "...Read more",
                    recognizer: gestureRecognizer,
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Related Products',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          const SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 90,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(agroProducts[index].image),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15.0)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8.0);
                },
                itemCount: agroProducts.length),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(12.0),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: const Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
