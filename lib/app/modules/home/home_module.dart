import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/app/modules/home/repositories/todo_repository.dart';
import 'package:todo_list/app/modules/home/repositories/todo_repository_impl.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind<ITodoRepository>(
            (i) => TodoRepository(FirebaseFirestore.instance)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
