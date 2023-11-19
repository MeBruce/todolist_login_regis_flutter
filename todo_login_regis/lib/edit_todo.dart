import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_login_register/todo_controller.dart';

class TodoEdit extends StatefulWidget {
  final int index;

  TodoEdit({Key? key, required this.index}) : super(key: key);

  @override
  _TodoEditState createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  late TodoController todoController;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    todoController = Get.find<TodoController>();
    textEditingController = TextEditingController(
      text: todoController.todos[widget.index].text ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Add what you need to do",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    var editing = todoController.todos[widget.index];
                    editing.text = textEditingController.text;
                    todoController.todos[widget.index] = editing;
                    Get.back();
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
