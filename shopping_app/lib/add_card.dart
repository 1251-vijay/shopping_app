import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CardProvider>(context, listen: false).cart;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cart')),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartdata = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartdata['imageUrl'] as String),
                radius: 30,
              ),
              title: Text(
                cartdata['title'].toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text('size : ${cartdata['sizes']}'),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Conform Delete '),
                      content: const Text('Are you sure!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CardProvider>(context, listen: false)
                                .removeCart(cartdata);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'yes',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
