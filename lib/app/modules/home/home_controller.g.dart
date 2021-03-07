// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$isNavbarAtom = Atom(name: '_HomeControllerBase.isNavbar');

  @override
  bool get isNavbar {
    _$isNavbarAtom.reportRead();
    return super.isNavbar;
  }

  @override
  set isNavbar(bool value) {
    _$isNavbarAtom.reportWrite(value, super.isNavbar, () {
      super.isNavbar = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void changeIsNavbar() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeIsNavbar');
    try {
      return super.changeIsNavbar();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNavbar: ${isNavbar}
    ''';
  }
}
