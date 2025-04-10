import 'package:flutter/material.dart';

class QuantityBox extends StatefulWidget {
  const QuantityBox({super.key});

  @override
  State<QuantityBox> createState() => _QuantityBoxState();
}

class _QuantityBoxState extends State<QuantityBox> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: decrement,
              ),
              Text('$quantity'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: increment,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "kg",
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart, color: Colors.white),
          label: Text(
            "Add to Cart",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
