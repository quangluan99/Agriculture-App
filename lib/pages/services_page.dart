import 'dart:ui';

import 'package:agriculture_app/models/service.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    final tetxTheme = Theme.of(context).textTheme;
    return GridView.builder(
      padding: const EdgeInsets.all(15.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Container(
          height: 80,
          width: 80,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: NetworkImage(
                    service.image,
                  ),
                  fit: BoxFit.cover)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                ),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  service.name,
                  style: tetxTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
