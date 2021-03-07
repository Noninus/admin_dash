import 'package:admin_dash/app/modules/relatorios/relatorios_controller.dart';
import 'package:admin_dash/app/modules/relatorios/relatorios_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class RelatoriosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RelatoriosController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => RelatoriosPage()),
      ];

  static Inject get to => Inject<RelatoriosModule>.of();
}
