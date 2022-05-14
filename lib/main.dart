import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todolist'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final todoValue = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddTodoPage()));
            setState(() {
              todos.add(todoValue);
            });
            //     print('value of the todo $todoValue');
          },
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          itemBuilder: (context, index) {
            String todo = todos[index];
            return ListTile(
              leading: Checkbox(value: false, onChanged: (value) {}),
              title: Text(todo),
              trailing: const Icon(Icons.delete),
            );
          },
          itemCount: todos.length,
        ));
  }
}

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText: 'Enter some text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    Navigator.pop(context, _controller.text);
                  }
                  // print('value for the input field ${_controller.text}');
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}

//Student(child: AnotherStudent(child: AnotherStudent(children:[AnotherStudent(), AnotherStudentAgain()])))
