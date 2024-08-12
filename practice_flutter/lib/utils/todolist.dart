import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  const Todolist({
    super.key,
    required this.taskname,
    required this.taskCompleted,
    required this.onchanged,
    required this.deleteTodo,
  });

  final String taskname;
  final bool taskCompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? deleteTodo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => deleteTodo?.call(context),
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                side: const BorderSide(color: Colors.white),
                activeColor: const Color.fromARGB(255, 255, 252, 252),
                checkColor: Colors.black,
                value: taskCompleted,
                onChanged: onchanged,
              ),
              Expanded(
                child: Text(
                  taskname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 2,
                    decorationColor: const Color.fromARGB(255, 91, 89, 89),
                  ),
                  overflow: TextOverflow.ellipsis, // Handle text overflow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
