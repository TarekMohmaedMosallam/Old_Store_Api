import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen_Work_Branch/Product_List_added_workBranch.dart';
import 'package:platzi_store/Platzi%20Store/view_models/bloc/platzi_product_bloc.dart';

class ProductListAdded extends StatelessWidget {
  const ProductListAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlatziProductBloc(),
      child: ProductListAddedWorkbranch(),
    );
  }
}
