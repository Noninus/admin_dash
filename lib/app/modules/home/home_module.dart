import 'package:admin_dash/app/modules/dashboard/dashboard_module.dart';
import 'package:admin_dash/app/modules/perfil/perfil_module.dart';
import 'package:admin_dash/app/modules/relatorios/relatorios_module.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/dashboard', module: DashboardModule()),
        ModularRouter('/relatorios', module: RelatoriosModule()),
        ModularRouter('/perfil', module: PerfilModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
