import 'package:abc12/model/todo_item.dart';
import 'package:abc12/riverpod/widget_r.dart';
import 'package:abc12/view/item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/subjects.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyHomePage(
                      title: 'Fslutter Demo Home xxxx bb Page')));
            },
            child: Text("login in")),
      ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController ctrl = TextEditingController();

  final BehaviorSubject<List<TodoItem>> todoListSubj =
      BehaviorSubject<List<TodoItem>>.seeded([]);

  void onAdd() {
    if (ctrl.text.isNotEmpty) {
      final original = todoListSubj.value;
      original.add(TodoItem(
        description: ctrl.text,
      ));

      todoListSubj.add(original);

      ctrl.text = "";
    }
  }

  void toggleByIdx(int idx) {
    final original = todoListSubj.value;
    final item = original[idx];
    final newItem =
        TodoItem(description: item.description, isDone: !item.isDone);

    original[idx] = newItem;
    todoListSubj.add(original);
  }

  void deleteByIdx(int idx) {
    final original = todoListSubj.value;
    original.removeAt(idx);
    todoListSubj.add(original);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ColoredBox(
                    color: Colors.orange,
                    child: TextField(
                      controller: ctrl,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: TextButton(
                      onPressed: onAdd,
                      child: const Text(
                        "ADD",
                        style: TextStyle(color: Colors.black),
                      )),
                )
              ],
            ),
            StreamBuilder<List<TodoItem>>(
                stream: todoListSubj,
                builder: (context, snapshot) =>
                    snapshot.hasData && snapshot.data!.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (ctx, idx) => TodoItemView(
                                    item: snapshot.data![idx],
                                    toggle: (_) {
                                      toggleByIdx(idx);
                                    },
                                    onDelete: () {
                                      deleteByIdx(idx);
                                    })),
                          )
                        : const SizedBox.shrink())
          ],
        )),
      );
}

class TestW extends StatelessWidget {
  TestW({super.key}) {
    debugPrint('TestW constructor');
  }

  @override
  Widget build(BuildContext context) {
    return const Text("TTTTTTTTT");
  }
}
