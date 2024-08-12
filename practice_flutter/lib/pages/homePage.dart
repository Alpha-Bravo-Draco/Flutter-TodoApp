import 'package:flutter/material.dart';
import 'package:practice_flutter/utils/todolist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _controller = TextEditingController();
  List<List<dynamic>> todoList = [
    ['check to mark complete', true],
    ['slide the tasks to delete ', false],
  ];

  void checkBoxChanged(int index, bool? value) {
    setState(() {
      todoList[index][1] = value ?? false; // Update the boolean value
    });
  }

  void addTodo() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        todoList.add([_controller.text, false]);
        _controller.clear();
      }
    });
  }

  void deleteTodoItem(BuildContext context, int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        title: const Text("Add your tasks"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Todolist(
                  taskname: todoList[index][0],
                  taskCompleted: todoList[index][1],
                  onchanged: (value) => checkBoxChanged(index, value),
                  deleteTodo: (context) => deleteTodoItem(context, index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Add a todo",
                      filled: true,
                      fillColor: Colors.deepPurple.shade300,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: addTodo,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
