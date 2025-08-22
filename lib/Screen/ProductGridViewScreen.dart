import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';
import '../Style/style.dart';
import 'ProductCreateScreen.dart';
import 'ProductUpdateScreen.dart';

class ProductGridViewscreen extends StatefulWidget {
  const ProductGridViewscreen({super.key});

  @override
  State<ProductGridViewscreen> createState() => _ProductGridViewscreenState();
}

class _ProductGridViewscreenState extends State<ProductGridViewscreen> {
  List productList = [];
  bool isLoading = true;

  @override
  void initState() {
    callData();
    super.initState();
  }

  callData() async {
    isLoading = true;
    var data = await ProductGridViewListRequest();
    setState(() {
      productList = data;
      isLoading = false;
    });
  }

  DeleteItem(id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Product"),
          content: Text("Are you sure you want to delete this product?"),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            OutlinedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                setState(() {
                  isLoading = true;
                });
                await ProductDeleteRequest(id);

                await callData();

                setState(() {
                  isLoading = false;
                });
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  GotoUpdate(context, productItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => productUpdateScreen(productItem: productItem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Product')),
      body: Stack(
        children: [
          Container(
            child:
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : RefreshIndicator(
                      onRefresh: () async {
                        await callData();
                      },
                      child: GridView.builder(
                        gridDelegate: ProductGridViewStyle(),
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    productList[index]['Img'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productList[index]['ProductName'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '\$${productList[index]['UnitPrice'].toString()}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              padding: EdgeInsets.fromLTRB(
                                                15,
                                                5,
                                                15,
                                                5,
                                              ),
                                              minimumSize: Size(32, 32),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                      top: Radius.circular(5),
                                                      bottom: Radius.circular(
                                                        5,
                                                      ),
                                                    ), // rounded corners
                                              ),
                                            ),
                                            onPressed: () {
                                              GotoUpdate(
                                                context,
                                                productList[index],
                                              );
                                            },
                                            child: Icon(
                                              CupertinoIcons
                                                  .ellipsis_vertical_circle,
                                              color: colorGreen,
                                              size: 18,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              padding: EdgeInsets.fromLTRB(
                                                15,
                                                5,
                                                15,
                                                5,
                                              ),
                                              minimumSize: Size(32, 32),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                      top: Radius.circular(5),
                                                      bottom: Radius.circular(
                                                        5,
                                                      ),
                                                    ), // rounded corners
                                              ),
                                            ),
                                            onPressed: () {
                                              DeleteItem(
                                                productList[index]['_id'],
                                              );
                                            },
                                            child: Icon(
                                              CupertinoIcons.delete,
                                              color: colorRed,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => ProductCreateScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
