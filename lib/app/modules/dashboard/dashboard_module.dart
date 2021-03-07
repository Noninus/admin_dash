import 'package:admin_dash/app/modules/dashboard/dashboard_controller.dart';
import 'package:admin_dash/app/modules/dashboard/dashboard_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class DashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DashboardController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => DashboardPage()),
      ];

  static Inject get to => Inject<DashboardModule>.of();
}
