import 'package:flutter/material.dart';
import 'package:macapps/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(), title: 'Sum Calculator');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> FormData = {
    'firstNumber': '',
    'secondNumber': '',
    'thirdNumber': '',
  };

  int sum = 0;

  @override
  Widget build(BuildContext context) {
    InputOnChange(field, inputValue) {
      setState(() {
        FormData.update(field, (value) => inputValue);
      });
    }

    addAllNumbers() {
      setState(() {
        FormData.forEach((key, value) {
          if (value.isNotEmpty) {
            sum += int.parse(value);
          }
        });
      });

      return sum;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sum Calculator')),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(sum.toString(), style: appTextStyle()),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                InputOnChange('firstNumber', value);
              },

              decoration: AppInputDecoration(Text('Enter first number')),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                InputOnChange('secondNumber', value);
              },
              decoration: AppInputDecoration(Text('Enter second number')),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                InputOnChange('thirdNumber', value);
              },
              decoration: AppInputDecoration(Text('Enter third number')),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: appButtonStyle(),
                onPressed: () {
                  addAllNumbers();
                },
                child: Text('Calculate Sum'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
