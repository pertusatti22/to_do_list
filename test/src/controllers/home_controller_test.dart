import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list/src/controllers/home_controller.dart';
import 'package:to_do_list/src/models/todo_model.dart';
import 'package:to_do_list/src/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);

  test('deve preencher variável todos', () async {
    when(() => repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}
