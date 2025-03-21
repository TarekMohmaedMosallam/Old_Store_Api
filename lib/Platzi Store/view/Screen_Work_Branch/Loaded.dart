import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platzi_store/Platzi%20Store/model/Api_Categories/Product_Lists.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen_Work_Branch/Select_Product.dart';
import 'package:platzi_store/Platzi%20Store/view_models/bloc/platzi_product_bloc.dart';

class LoadedData extends StatefulWidget {
  const LoadedData({super.key, required this.products});

  final List<ProductLists> products;

  @override
  State<LoadedData> createState() => _LoadedDataState();
}

class _LoadedDataState extends State<LoadedData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PlatziProductBloc, PlatziProductState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<PlatziProductBloc>().add(PlatziProductRefush());
              await Future.delayed(
                const Duration(seconds: 1),
              ); // Ensures refresh completes
            },
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                final product = widget.products[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Image.network(
                         product.images[0],
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  const Icon(Icons.error, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => SelectProduct(
                                      title: product.title,
                                      image: product.images,
                                      price: product.price,
                                      description: product.description,
                                    ),
                              ),
                            );
                          },
                          child: product.images.isEmpty 
                              ? Text("no Image for Product") 
                              : ListTile(
                            title: Text(product.title),
                            trailing: Text(
                              '\$${product.price.toStringAsFixed(2)}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
