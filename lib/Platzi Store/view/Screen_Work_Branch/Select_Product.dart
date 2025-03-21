import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platzi_store/Platzi%20Store/model/Api_Categories/Product_Lists.dart';
import 'package:platzi_store/Platzi%20Store/view_models/bloc/platzi_product_bloc.dart';

class SelectProduct extends StatelessWidget {
  const SelectProduct({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  });

  final String title;
  final List<String> image;
  final double price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: 700,
                height: 250,
                child: Image.network(
                  image[0],
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.error, size: 50),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
             
                ElevatedButton(
                  onPressed: () {
                    final product = ProductLists(
                      title: title,
                      images: image,
                      price: price,
                      description: description,
                    );

                    // Triggering the AddToCart event in BLoC
                    context.read<PlatziProductBloc>().add(
                      AddToCart(product: product),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Added to cart!"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: const Text("Add to Cart"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
