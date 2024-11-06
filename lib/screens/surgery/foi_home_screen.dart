import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoiHomeScreen extends StatelessWidget {
  const FoiHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: 'Patient',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye),
            label: 'Surgeries',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_fill),
            label: 'Templates',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
              child: Material(
                color: Colors
                    .transparent, // Ensure no Cupertino background is applied
                child: Text(
                  'Selected tab $index',
                  style: const TextStyle(
                    fontSize: 16, // Increase font size for clarity
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
