import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pnum = TextEditingController();

  List<Todo> todos=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Contact list'),
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context,index){
          return ListTile(
            onLongPress:(){
              showTodoDetails(todos[index]);
            } ,
            title: Text(todos[index].name),

          );
        },
        separatorBuilder: (context,index){
          return const Divider(height: 0,);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newtodo();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.black,

      ),
    );
  }

  void newtodo() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _name = TextEditingController();
        TextEditingController _email = TextEditingController();
        TextEditingController _pnum = TextEditingController();

        return AlertDialog(
          title: Text('Add new Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _pnum,
                decoration: InputDecoration(
                  hintText: 'PhoneNumber',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_name.text.trim().isNotEmpty &&
                    _email.text.trim().isNotEmpty) {
                  todos.add(Todo(
                    _name.text.trim(),
                    _email.text.trim(),
                    _pnum.text.trim(),
                  ));
                  if (mounted) {
                    setState(() {});
                  }
                  _name.clear();
                  _email.clear();
                  _pnum.clear();
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showTodoDetails(Todo todo) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Contact Info',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text('Name: ${todo.name}'),
              const SizedBox(height: 8.0),
              Text('Emai: ${todo.email}'),
              const SizedBox(height: 8.0),
              Text('Phone Number: ${todo.number}'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    todos.remove(todo);
                  });
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }




}

class Todo {

  String name,email,number;
  Todo(this.name,this.email,this.number);

}