import 'package:admin_dash/app/modules/home/home_widget.dart';
import 'package:admin_dash/app/modules/relatorios/relatorios_module.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => HomePage(body: HomeWidget())),
        ModularRouter('/relatorios', module: RelatoriosModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
