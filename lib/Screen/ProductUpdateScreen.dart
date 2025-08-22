import 'package:flutter/material.dart';
import 'package:macapps/Style/style.dart';

import '../RestAPI/RestClient.dart';
import 'ProductGridViewScreen.dart';

class productUpdateScreen extends StatefulWidget {
  final Map productItem;

  const productUpdateScreen({super.key, required this.productItem});

  @override
  State<productUpdateScreen> createState() => _productUpdateScreenState();
}

class _productUpdateScreenState extends State<productUpdateScreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": "",
  };
  bool Loading = false;

  @override
  void initState() {
    setState(() {
      FormValues.update('Img', (value) => widget.productItem['Img']);
      FormValues.update(
        'ProductCode',
        (value) => widget.productItem['ProductCode'],
      );
      FormValues.update(
        'ProductName',
        (value) => widget.productItem['ProductName'],
      );
      FormValues.update(
        'Qty',
        (value) => widget.productItem['Qty'].toString().trim().replaceAll(
          "pcs",
          "Pcs",
        ),
      );

      FormValues.update(
        'TotalPrice',
        (value) => widget.productItem['TotalPrice'],
      );
      FormValues.update(
        'UnitPrice',
        (value) => widget.productItem['UnitPrice'],
      );
      super.initState();
    });
  }

  void InputOnChang(String Mapkey, String Textvalue) {
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues["Img"]!.length == 0) {
      ErrorToast("Please Enter Product Image");
    } else if (FormValues["ProductCode"]!.length == 0) {
      ErrorToast("Please Enter Product Code");
    } else if (FormValues["ProductName"]!.length == 0) {
      ErrorToast("Please Enter Product Name");
    } else if (FormValues["Qty"]!.length == 0) {
      ErrorToast("Please Select Product Qty");
    } else if (FormValues["TotalPrice"]!.length == 0) {
      ErrorToast("Please Enter Total Price");
    } else if (FormValues["UnitPrice"]!.length == 0) {
      ErrorToast("Please Enter Unit Price");
    } else {
      setState(() {
        Loading = true;
      });

      await ProductUpdateRequest(FormValues, widget.productItem['_id']);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder) => ProductGridViewscreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Product')),
      body: Stack(
        children: [
          Container(
            child:
                Loading
                    ? Center(child: CircularProgressIndicator())
                    : (SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: FormValues['ProductName'],
                            decoration: AppInputDecoration("Product Name"),
                            onChanged: (Textvalue) {
                              InputOnChang("ProductName", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: FormValues['ProductCode'],
                            decoration: AppInputDecoration("Product Code"),
                            onChanged: (Textvalue) {
                              InputOnChang("ProductCode", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: FormValues['Img'],
                            decoration: AppInputDecoration("Product Image"),
                            onChanged: (Textvalue) {
                              InputOnChang("Img", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: FormValues['UnitPrice'],
                            decoration: AppInputDecoration(
                              "Product Unit Price",
                            ),
                            onChanged: (Textvalue) {
                              InputOnChang("UnitPrice", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            initialValue: FormValues['TotalPrice'],
                            decoration: AppInputDecoration("Total Price"),
                            onChanged: (Textvalue) {
                              InputOnChang("TotalPrice", Textvalue);
                            },
                          ),

                          SizedBox(height: 20),
                          AppDropDownStyle(
                            DropdownButton(
                              isExpanded: true,
                              underline: Container(),
                              value: FormValues["Qty"],
                              items: [
                                DropdownMenuItem(
                                  value: '',
                                  child: Text('Select Qty'),
                                ),
                                DropdownMenuItem(
                                  value: '1 Pcs',
                                  child: Text('1 Pcs'),
                                ),
                                DropdownMenuItem(
                                  value: '2 Pcs',
                                  child: Text('2 Pcs'),
                                ),
                                DropdownMenuItem(
                                  value: '3 Pcs',
                                  child: Text('3 Pcs'),
                                ),
                              ],
                              onChanged: (Textalue) {
                                InputOnChang("Qty", Textalue!);
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: ElevatedButton(
                              style: AppButtonStyle(),
                              onPressed: () {
                                FormOnSubmit();
                              },
                              child: SuccessButtonChild('Update'),
                            ),
                          ),
                        ],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
