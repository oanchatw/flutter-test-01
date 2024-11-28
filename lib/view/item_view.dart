import 'package:abc12/model/todo_item.dart';
import 'package:flutter/material.dart';

class TodoItemView extends StatelessWidget {
  final TodoItem item;
  final void Function(bool?) toggle;
  final void Function() onDelete;
  const TodoItemView(
      {super.key,
      required this.item,
      required this.toggle,
      required this.onDelete});

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Checkbox(value: item.isDone, onChanged: toggle),
            Text(item.description),
            IconButton(onPressed: onDelete, icon: const Icon(Icons.delete))
          ],
        ),
      );
}
