import 'package:flutter/material.dart';

import 'Fragment/FavoritesFragment.dart';
import 'Fragment/HomeFragment.dart';
import 'Fragment/ProfileFragment.dart';
import 'Fragment/SettingsFragment.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.favorite), text: "Favorites"),
              Tab(icon: Icon(Icons.person), text: "Profile"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
              Tab(icon: Icon(Icons.search), text: "Search"),
              Tab(icon: Icon(Icons.mail), text: "Messages"),
              Tab(icon: Icon(Icons.phone), text: "Calls"),
              Tab(icon: Icon(Icons.more_vert), text: "More"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeFragment(),
            Favoritesfragment(),
            Profilefragment(),
            Settingsfragment(),
          ],
        ),
      ),
    );
  }
}

//6
