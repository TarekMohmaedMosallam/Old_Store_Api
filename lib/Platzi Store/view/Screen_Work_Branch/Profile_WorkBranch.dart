import 'package:flutter/material.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen/HomeScreen.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen/Product_List_added.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen_Work_Branch/Login_page_WorkBranch.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen_Work_Branch/Product_List_added_workBranch.dart';

class ProfileWorkbranch extends StatefulWidget {
  const ProfileWorkbranch({super.key});

  @override
  State<ProfileWorkbranch> createState() => _ProfileWorkbranchState();
}

class _ProfileWorkbranchState extends State<ProfileWorkbranch> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        spacing: 150,
        children: [
          Icon(Icons.person, size: 100),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPageWorkbranch(),
                  ),
                );
              },
              child: Text("Log Out", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
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
