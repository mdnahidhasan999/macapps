import 'package:flutter/material.dart';
import 'package:macapps/style.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List todoList = [];
  String todoItem = '';
  UniqueKey _formFieldKey = UniqueKey();

  appInputOnChange(value) {
    todoItem = value;
  }

  addToDo() {
    String currentItem = todoItem.trim();
    if (currentItem.isNotEmpty) {
      setState(() {
        todoList.add(currentItem);
        todoItem = '';
        _formFieldKey = UniqueKey();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid todo item.'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  removeToDo(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToDo App')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: TextFormField(
                      onChanged: (value) {
                        appInputOnChange(value);
                      },
                      decoration: AppInputDecoration(Text('List Item')),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 30,
                    child: ElevatedButton(
                      style: appButtonStyle(),

                      onPressed: () {
                        addToDo();
                      },
                      child: Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 90,
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: SizeBox50(
                      Row(
                        children: [
                          Expanded(
                            flex: 80,
                            child: Text(todoList[index].toString()),
                          ),
                          Expanded(
                            flex: 20,
                            child: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                removeToDo(index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
