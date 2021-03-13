import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase() {
    if (window.physicalSize.width < 750) {
      changeIsNavbar();
    }
  }
  @observable
  bool isNavbar = true;

  @action
  void changeIsNavbar() {
    isNavbar = !isNavbar;
  }
}
