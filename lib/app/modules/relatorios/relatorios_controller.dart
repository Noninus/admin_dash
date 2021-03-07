import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'relatorios_controller.g.dart';

@Injectable()
class RelatoriosController = _RelatoriosControllerBase
    with _$RelatoriosController;

abstract class _RelatoriosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
