import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'perfil_controller.g.dart';

@Injectable()
class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
