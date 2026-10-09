import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TodoPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<String> todos = [];
  TextEditingController controller = TextEditingController();


  void tambah() {
    if (controller.text.isEmpty) return;
    setState(() {
      todos.add(controller.text);
    });
    controller.clear();
  }

  void hapus(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List Mahasiswa')),
      body: Column(
        children: [

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Tulis tugas...'),
                ),
              ),
              ElevatedButton(onPressed: tambah, child: Text('Tambah')),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => hapus(index),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}