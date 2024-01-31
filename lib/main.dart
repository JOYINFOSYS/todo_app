
import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),

    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<todo> todos = [];
  final titleTEController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        title: Text("Todo App",),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            todos.clear();
            setState(() {});
          }, icon: Icon(Icons.delete_sweep_sharp))
        ],
    ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemCount: todos.length,
                itemBuilder: (context,index){

                  return ListTile(

                    onLongPress: (){
                      todos[index].isDone = !todos[index].isDone;
                      if(mounted){
                        setState(() {});
                      }

                    },
                    tileColor: Colors.deepPurple.shade100,
                    leading:todos[index].isDone ? Icon(Icons.done_outline_rounded) : Icon(Icons.circle_outlined),

                    title: Text(todos[index].title),
                    trailing: IconButton(onPressed: (){
                      todos.removeAt(index);
                      setState(() {});
                    },icon: Icon(Icons.delete),),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 4,);
            },),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            showModalBottomSheet(context: context, builder: (context) {
              return Container(

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleTEController,
                      ),
                      ElevatedButton(onPressed: (){

                        todos.add(todo(titleTEController.text.trim(), false));
                        titleTEController.clear();
                        setState(() {});

                      }, child: const Text("Add"))
                    ],
                  ),
                ),
              );
            });
          },child: Icon(Icons.add),),
    );

  }
}

class todo{
  String title;
  bool isDone;
  todo(this.title, this.isDone);
}
