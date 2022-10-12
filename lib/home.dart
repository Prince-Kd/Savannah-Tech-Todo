import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:todo/todo_model.dart';
import 'package:todo/todo_repo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo list')),
      body: FutureBuilder<List>(
          future: TodoRepo().getAllTodos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List? data = snapshot.data;
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  TodoModel todo = TodoModel.fromJson(data[index]);
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Todo(id: todo.id!)));
                    },
                    title: Text(todo.title!),
                    subtitle:
                        Text(todo.completed ? "Completed" : "Not completed"),
                    trailing: todo.completed
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.info,
                            color: Colors.amber,
                          ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
