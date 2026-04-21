import 'package:flutter/material.dart';
import 'checkout_page.dart';

/// Shows a single product with quantity controls and Buy Now button.
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;
  final double _price = 79.99;

  @override
  Widget build(BuildContext context) {
    final total = _price * _quantity;

    return Scaffold(
      appBar: AppBar(title: const Text('Shop')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://www.google.com/imgres?q=headphones&imgurl=https%3A%2F%2Fwww.skullcandy.eu%2Fcdn%2Fshop%2Ffiles%2Fhazard-collection-tile.png%3Fformat%3Dpjpg%26v%3D1758041530%26width%3D1500&imgrefurl=https%3A%2F%2Fwww.skullcandy.eu%2Fen-es%2Fcollections%2Fheadphones%3Fsrsltid%3DAfmBOop8It47d_dxjRzMVvqtfVxzAGf2-0liLJEMi7Irp7QkeeS0v3Zl&docid=YDu5DAaBXguAvM&tbnid=tDPGVW30suGscM&vet=12ahUKEwjiqoip8v2TAxU2umMGHRHTIsgQnPAOegQIZhAB..i&w=1080&h=580&hcb=2&ved=2ahUKEwjiqoip8v2TAxU2umMGHRHTIsgQnPAOegQIZhAB',
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 220,
                  color: Colors.grey[800],
                  child: const Icon(Icons.headphones, size: 80, color: Colors.white54),
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text('Wireless Headphones',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('₱${_price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, color: Colors.greenAccent)),
            const SizedBox(height: 12),
            Text(
              'Premium noise-cancelling wireless headphones with 30-hour battery life.',
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),

            const SizedBox(height: 24),

            // Quantity controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Minus button
                IconButton.filled(
                  onPressed: _quantity > 1
                      ? () => setState(() => _quantity--)
                      : null,
                  icon: const Icon(Icons.remove),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    disabledBackgroundColor: Colors.grey[900],
                  ),
                ),

                // Quantity display
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '$_quantity',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                // Plus button
                IconButton.filled(
                  onPressed: () => setState(() => _quantity++),
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Total
            Center(
              child: Text(
                'Total: ₱${total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),

            const Spacer(),

            // Buy Now button
            ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CheckoutPage(
                    productName: 'Wireless Headphones',
                    price: _price,
                    quantity: _quantity,
                  ),
                ),
              ),
              icon: const Icon(Icons.shopping_cart),
              label: Text('Buy Now — ₱${total.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}