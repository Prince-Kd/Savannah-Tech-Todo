import 'package:flutter/material.dart';
import 'package:todo/todo_model.dart';
import 'package:todo/todo_repo.dart';

class Todo extends StatefulWidget {
  final int id;
  const Todo({Key? key, required this.id}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool loading = true;
  TodoModel? todo;
  getTodo() async {
    await TodoRepo().getSingleTodo(id: widget.id).then((value) {
      setState(() {
        loading = false;
        todo = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo'),
        ),
        body: loading
            ? Center(
                child: Text('Loading...'),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Id: ${todo!.id}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Title: ${todo!.title}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'User id: ${todo!.userId}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Completed: ${todo!.completed ? "Todo completed" : "Todo not completed"}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ));
  }
}
