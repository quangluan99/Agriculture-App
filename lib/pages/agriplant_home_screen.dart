import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AgriplantHomeScreen extends StatelessWidget {
  const AgriplantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerParts(),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          searchBarAndFilter(),
          const SizedBox(
            height: 12.0,
          ),
          freeConsultationBanner(),
          const SizedBox(
            height: 12.0,
          ),
          const Row(
            children: [
              Text(
                'Faetured Products',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                'See all',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              )
            ],
          ),
          GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: agroProducts.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductItems(
                product: agroProducts[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

Container freeConsultationBanner() {
  return Container(
    height: 200.0,
    decoration: BoxDecoration(color: Colors.green.withOpacity(0.1)),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Free Consulation',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                const Text(
                  'Get free support from our customer service',
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.green.shade600),
                    onPressed: () {},
                    child: const Text(
                      'Call Now',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
          Flexible(
              child: Center(
            child: Image.asset(
              'assets/images/rb_534.png',
            ),
          ))
        ],
      ),
    ),
  );
}

Row searchBarAndFilter() {
  return Row(
    children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Search Here...',
              isDense: true,
              contentPadding: const EdgeInsets.all(10.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 22.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade300),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.green[500],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            onPressed: () {},
            icon: const Icon(
              IconlyLight.filter,
              size: 30.0,
            )),
      ),
    ],
  );
}

AppBar headerParts() {
  return AppBar(
    title: Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        const Column(
          children: [
            Text(
              'Hi Willson👏 ',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Enjoy The Service !',
              style: TextStyle(fontSize: 14.0),
            )
          ],
        ),
        const Spacer(),
        const Stack(
          children: [
            Icon(
              Icons.notifications,
              size: 28.0,
              color: Colors.green,
            ),
            Positioned(
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 7.0,
                child: Text(
                  '3',
                  style: TextStyle(fontSize: 10.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
