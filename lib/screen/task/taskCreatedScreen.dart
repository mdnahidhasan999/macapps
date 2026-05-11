import 'package:flutter/material.dart';
import 'package:macapps/style.dart';

class createdTaskListScreen extends StatefulWidget {
  const createdTaskListScreen({super.key});

  @override
  State<createdTaskListScreen> createState() => _createdTaskListScreenState();
}

class _createdTaskListScreenState extends State<createdTaskListScreen> {
  Map<String, String> formValues = {
    'title': '',
    'description': '',
    'status': 'New',
  };
  bool isSubmitLoading = false;

  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, textValue);
    });
  }

  formOnSubmit() async {
    if (formValues['title']!.isEmpty) {
      errorToast("Please Enter Title");
    } else if (formValues['description']!.isEmpty) {
      errorToast("Please Enter Description");
    } else {
      setState(() {
        isSubmitLoading = true;
      });
      bool res = true;
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        setState(() {
          isSubmitLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Created New Task"),
        centerTitle: true,
        backgroundColor: colorGreen,
        foregroundColor: colorWhite,
      ),
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            alignment: Alignment.topCenter,
            child:
                isSubmitLoading
                    ? (Center(child: CircularProgressIndicator()))
                    : (SingleChildScrollView(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add New Task", style: head1Text(colorDarkBlue)),

                          SizedBox(height: 20),

                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("title", textValue);
                            },

                            decoration: appInputDecoration("Task Name"),
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("description", textValue);
                            },
                            decoration: appInputDecoration("Info"),
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: appButtonStyle(),
                            child: successButtonChild('Create'),
                            onPressed: () {
                              formOnSubmit();
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
