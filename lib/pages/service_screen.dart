import 'dart:ui';

import 'package:agriculture_app/models/service.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Services'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.green,
                  size: 30.0,
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
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.95,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 15.0,
        ),
        padding: const EdgeInsets.all(15.0),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: NetworkImage(services[index].image),
                    fit: BoxFit.cover),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      services[index].name,
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
