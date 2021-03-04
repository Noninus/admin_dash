import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'loading_controller.g.dart';

@Injectable()
class LoadingController = _LoadingControllerBase with _$LoadingController;

abstract class _LoadingControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
