import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';
import '../Style/style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreen();
}

class _ProductCreateScreen extends State<ProductCreateScreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": "",
  };
  bool Loading = false;

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

      await ProductCreateRequest(FormValues);

      setState(() {
        Loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Product')),
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
                            decoration: AppInputDecoration("Product Name"),
                            onChanged: (Textvalue) {
                              InputOnChang("ProductName", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: AppInputDecoration("Product Code"),
                            onChanged: (Textvalue) {
                              InputOnChang("ProductCode", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: AppInputDecoration("Product Image"),
                            onChanged: (Textvalue) {
                              InputOnChang("Img", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: AppInputDecoration(
                              "Product Unit Price",
                            ),
                            onChanged: (Textvalue) {
                              InputOnChang("UnitPrice", Textvalue);
                            },
                          ),
                          SizedBox(height: 20),

                          TextFormField(
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
                              child: SuccessButtonChild('Submit'),
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

//6crud
