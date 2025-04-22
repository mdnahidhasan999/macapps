import 'package:flutter/material.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var myItems = [
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 1",
      },
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 2",
      },
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 3",
      },
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 4",
      },
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 5",
      },
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 6",
      },
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 7",
      },
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 8",
      },
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 9",
      },
      {
        "img": "https://www.w3schools.com/howto/img_avatar.png",
        "title": "Item 10",
      },
    ];
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          childAspectRatio: 1.1,
        ),
        itemCount: myItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              mySnackBar(myItems[index]['title'], context);
            },
            child: Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              height: 100,
              child: Image.network(myItems[index]['img']!),
            ),
          );
        },
      ),
    );
  }
}