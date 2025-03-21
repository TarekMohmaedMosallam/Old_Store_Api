import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen/HomeScreen.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen/Product_List_added.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen_Work_Branch/Profile_WorkBranch.dart';
import 'package:platzi_store/Platzi%20Store/view_models/bloc/platzi_product_bloc.dart';

class ProductListAddedWorkbranch extends StatefulWidget {
  const ProductListAddedWorkbranch({super.key});

  @override
  State<ProductListAddedWorkbranch> createState() =>
      _ProductListAddedWorkbranchState();
}

class _ProductListAddedWorkbranchState
    extends State<ProductListAddedWorkbranch> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List Added'),
        automaticallyImplyLeading: false,
      ),
      body:  BlocBuilder<PlatziProductBloc, PlatziProductState>(
  builder: (context, state) {
    if (state is PlatziProductLoaded && state.cart.isNotEmpty) {
      return ListView.builder(
        itemCount: state.cart.length,
        itemBuilder: (context, index) {
          final product = state.cart[index];
          return Card(
            child: ListTile(
              title: Text(product.title),
              subtitle: Text("\$${product.price}"),
              leading: product.images.isNotEmpty
                  ? Image.network(
                      product.images[0],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image_not_supported),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<PlatziProductBloc>().add(
                    RemoveFromCart(product: product),
                  );
                },
              ),
            ),
          );
        },
      );
    } else {
      return const Center(child: Text("No products in cart."));
    }
  },
)
,
    
bottomNavigationBar: BottomNavigationBar(
  currentIndex: selectedIndex,
  onTap: (value) {
    setState(() {
      selectedIndex = value;
      if (selectedIndex == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Homescreen()),
        );
      } else if (selectedIndex == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductListAddedWorkbranch(),
          ),
        );
      } else if (selectedIndex == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileWorkbranch(),
          ),
        );
      }
    });
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.store_mall_directory_sharp),
      label: 'Store',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'Products Bought',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
),

    );
  }
}
