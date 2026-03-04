import 'package:flutter/material.dart';

import '../style.dart';

BottomNavigationBar appBottomNav(currentIndex, onItemTapped) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "New"),
      BottomNavigationBarItem(
        icon: Icon(Icons.pending_actions),
        label: "Progress",
      ),
      BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
      BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel"),
    ],
    currentIndex: currentIndex,
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGray,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    onTap: onItemTapped,
  );
}
