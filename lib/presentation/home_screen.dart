import 'package:api_handleing_with_bloc_and_dio/data/modelclass.dart';
import 'package:api_handleing_with_bloc_and_dio/logic/cubit/todo_cubit.dart';
import 'package:api_handleing_with_bloc_and_dio/logic/cubit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API handling'), centerTitle: true,),
      body: SafeArea(
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {

            if(state is TodoLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is TodoLoaded){
              return ListView.builder(
                itemCount: state.lst.length,
                  itemBuilder: (context,index){
                    TodoClass todo= state.lst[index];
                    return ListTile(
                      title: Text(todo.id.toString()),
                      subtitle: Text(todo.title.toString()),
                    );

                  },
              );
            }
            return const Center(child: Text('an error has occurred'),);
          },
        ),
      ),
    );
  }
}
