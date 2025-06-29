import 'dart:async';
import 'package:agriculture_app/models/product.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.product});
  final AgroProduct product;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 0;
  void addQuantity() {
    setState(() {
      quantity++;
    });
  }

  void removeQuantity() {
    if (quantity >= 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart, //vuốt xóa từ phải qua trái
      background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              'Item sẽ bị xóa sau 2 giây',
              style: textTheme.bodyLarge!.copyWith(color: Colors.white),
            ),
          )),

      confirmDismiss: (direction) async {
        final completer = Completer<bool>();

        // Hiển thị SnackBar cho phép Keep hoặc Remove
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: const Text('Remove from cart?'),
            action: SnackBarAction(
              textColor: Colors.white,
              label: 'Keep',
              onPressed: () {
                // Người dùng ấn Keep sẽ trả về false
                completer.complete(false);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );

        Timer(
          const Duration(seconds: 2),
          () {
            if (!completer.isCompleted) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              completer.complete(true);
            }
          },
        );

        return completer.future;
      },

      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(
              color: Colors.black,
              width: 0.05,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.product.image,
                  width: 95,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      widget.product.description,
                      style: textTheme.bodySmall,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${widget.product.price}',
                          style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: IconButton(
                              style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.green.shade100),
                              onPressed: removeQuantity,
                              icon: const Icon(Icons.remove)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '$quantity',
                          ),
                        ),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: IconButton(
                              style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.green.shade100),
                              onPressed: addQuantity,
                              icon: const Icon(Icons.add)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
