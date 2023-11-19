import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_login_register/todo_controller.dart';
import 'package:todolist_login_register/edit_todo.dart';
import 'package:todolist_login_register/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/Home_screen';
  final TodoController todoController = Get.put(TodoController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyToDo'),
        centerTitle: true,
        backgroundColor: const Color(0xFF3F60A0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TodoScreen());
        },
        child: Icon(
          Icons.add,
          size: 30, // กำหนดขนาดของไอคอนตามที่คุณต้องการ
        ),
        backgroundColor:
            const Color(0xFF3F60A0), // กำหนดสีพื้นหลังของ FAB ตามที่คุณต้องการ
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // กำหนดรูปร่างของ FAB ตามที่คุณต้องการ
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.deepOrange,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (_) {
              todoController.todos.removeAt(index);
              Get.snackbar('Remove!', "Task was successfully deleted",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: ListTile(
              title: Text(
                todoController.todos[index].text!,
                style: todoController.todos[index].done
                    ? const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      )
                    : const TextStyle(
                        color: Colors.black,
                      ),
              ),
              trailing: IconButton(
                onPressed: () => Get.to(() => TodoEdit(index: index)),
                icon: const Icon(Icons.edit),
              ),
              leading: Checkbox(
                value: todoController.todos[index].done,
                onChanged: (newValue) {
                  var todo = todoController.todos[index];
                  todo.done = newValue!;
                  todoController.todos[index] = todo;
                },
              ),
            ),
          ),
          itemCount: todoController.todos.length,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 350,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF3F60A0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Get.offNamed('login');
                },
                child: const Text("Sign out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
