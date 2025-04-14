import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 0)),
    );
  }

  myAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text('Do you want to delete this item?'),
            content: Text('This action cannot be undone.'),
            actions: [
              TextButton(
                onPressed: () {
                  mySnackBar("Deleted", context);
                  Navigator.of(context).pop();
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.black,
      padding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter AppBar'),
        titleSpacing: 10,
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        toolbarOpacity: 1,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              mySnackBar("Comments", context);
            },
            icon: Icon(Icons.comment),
          ),
          IconButton(
            onPressed: () {
              mySnackBar("Search", context);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              mySnackBar("Settings", context);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 100,
        backgroundColor: Colors.amber,
        onPressed: () {
          mySnackBar("Add", context);
        },
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            mySnackBar("Home", context);
          } else if (index == 1) {
            mySnackBar("Search", context);
          } else if (index == 2) {
            mySnackBar("Settings", context);
          }
        },
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: Padding(
                  padding: EdgeInsets.only(top: 30),

                  child: Text(
                    'Nahid Hasan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                accountEmail: Text('info@gmail.com'),
                currentAccountPicture: Image.network(
                  'https://www.w3schools.com/howto/img_avatar.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                mySnackBar("Home", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                mySnackBar("Search", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                mySnackBar("Settings", context);
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: Padding(
                  padding: EdgeInsets.only(top: 30),

                  child: Text(
                    'Nahid Hasan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                accountEmail: Text('info@gmail.com'),
                currentAccountPicture: Image.network(
                  'https://www.w3schools.com/howto/img_avatar.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                mySnackBar("Home", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                mySnackBar("Search", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                mySnackBar("Settings", context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            myAlertDialog(context);
          },
          style: buttonStyle,
          child: Text('Click Me'),
        ),
      ),
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           mySnackBar("TextButton", context);
      //         },
      //         child: Text('TextButton'),
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           mySnackBar("ElevatedButton", context);
      //         },
      //         style: buttonStyle,
      //         child: Text('ElevatedButton'),
      //       ),
      //       OutlinedButton(
      //         onPressed: () {
      //           mySnackBar("OutlinedButton", context);
      //         },
      //         child: Text('OutlinedButton'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
