import 'package:api_handleing_with_bloc_and_dio/data/modelclass.dart';
import 'package:api_handleing_with_bloc_and_dio/data/repositories/post_repository.dart';
import 'package:api_handleing_with_bloc_and_dio/logic/cubit/todo_state.dart';
import 'package:bloc/bloc.dart';


class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoLoading()){
   fetchInfo();
  }
  Repository repo=Repository();
  Future<void> fetchInfo() async {
      try{
        List<TodoClass> list= await repo.fetchPosts();
        emit(TodoLoaded(list));
      }catch(e){
         emit(TodoErrorState(e.toString()));
      }
  }
}
