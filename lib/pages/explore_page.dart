import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: [
        Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    labelText: 'Search here...',
                    isDense: true,
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            const SizedBox(
              width: 14.0,
            ),
            IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    padding: const EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.filter,
                  color: Colors.white,
                )),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 175.0,
          child: Card(
            color: Colors.green.shade50,
            elevation: 0.8,
            shadowColor: Colors.green.shade600,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Free Consulation',
                          style: textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.green),
                        ),
                        Text(
                          maxLines: 2,
                          'Get free support from our customer service',
                          style: textTheme.bodyLarge,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0))),
                            onPressed: () {},
                            child: Text(
                              'Call Now',
                              style: textTheme.bodyMedium!
                                  .copyWith(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/rb_534.png',
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Products',
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: textTheme.bodyMedium!.copyWith(color: Colors.green),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        GridView.builder(
          itemCount: agroProducts.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.88,
          ),
          itemBuilder: (context, index) {
            final agro = agroProducts[index];
            return ProductCard(
              product: agro,
            );
          },
        )
      ],
    );
  }
}
