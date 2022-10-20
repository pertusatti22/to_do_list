import 'package:flutter/material.dart';
import 'package:to_do_list/src/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _start() {
      return Container();
    }

    _loading() {
      return const Center(child: CircularProgressIndicator());
    }

    _success() {
      return ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      );
    }

    _error() {
      return Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Tentar novamente'),
        ),
      );
    }

    stateManagement(HomeState state) {
      switch (state) {
        case HomeState.start:
          return _start();
        case HomeState.loading:
          return _loading();
        case HomeState.error:
          return _error();
        case HomeState.success:
          return _success();
        default:
          return _start();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Todo\'s'),
      ),
      body: stateManagement(),
    );
  }
}
