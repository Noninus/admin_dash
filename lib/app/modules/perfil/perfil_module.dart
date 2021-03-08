import 'package:admin_dash/app/modules/perfil/perfil_controller.dart';
import 'package:admin_dash/app/modules/perfil/perfil_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PerfilModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PerfilController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PerfilPage()),
      ];

  static Inject get to => Inject<PerfilModule>.of();
}
