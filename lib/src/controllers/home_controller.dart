import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final repository = TodoRepository();

  Future start() async {
    todos = await repository.fetchTodos();
  }
}
