// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:platzi_store/Platzi%20Store/model/Api_Categories/Product_Lists.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen/HomeScreen.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen/Product_List_added.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen_Work_Branch/Loaded.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen_Work_Branch/Product_List_added_workBranch.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen_Work_Branch/Profile_WorkBranch.dart';
import 'package:platzi_store/Platzi%20Store/view_models/bloc/platzi_product_bloc.dart';

class HomescreenWorkbranch extends StatefulWidget {
  const HomescreenWorkbranch({super.key});

  @override
  State<HomescreenWorkbranch> createState() => _HomescreenWorkbranchState();
}

class _HomescreenWorkbranchState extends State<HomescreenWorkbranch> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Trigger the success event to fetch products
    context.read<PlatziProductBloc>().add(PlatziProductSuccess());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      appBar: AppBar(
        title: const Text('HomeScreen'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: BlocBuilder<PlatziProductBloc, PlatziProductState>(
          builder: (context, state) {
            if (state is PlatziProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PlatziProductLoaded) {
              final List<ProductLists> products = state.products;
              return LoadedData(products: products);
            } else if (state is PlatziProductError) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PlatziProductBloc>().add(PlatziProductRefush());
                  await Future.delayed(const Duration(seconds: 1));
                },
                child: Center(child: Text('Error: ${state.error}')),
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
