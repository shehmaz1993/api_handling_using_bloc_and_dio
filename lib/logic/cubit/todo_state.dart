import '../../data/modelclass.dart';

abstract class TodoState {}

class TodoLoading extends TodoState {}
class TodoLoaded extends TodoState{
  final List<TodoClass> lst;
  TodoLoaded(this.lst);
}
class TodoErrorState extends TodoState{
  final String errorMessage;
  TodoErrorState(this.errorMessage);
}
