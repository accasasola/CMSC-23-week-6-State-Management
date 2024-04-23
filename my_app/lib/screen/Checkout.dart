import 'package:flutter/material.dart';
import 'package:my_app/provider/shoppingcart_provider.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the total amount to be paid here
            Text(
              "Total Amount: \$${context.watch<ShoppingCart>().cartTotal.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the payment logic here
                // Set the total amount to zero
                context.read<ShoppingCart>().cartTotal = 0;

                // Show a snackbar with the message "Payment Successful"
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Payment Successful"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}
