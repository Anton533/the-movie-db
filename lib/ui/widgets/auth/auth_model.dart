import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;

  Future<void> auth(BuildContext context) async {}
}

class AuthModelProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthModelProvider({key, required this.model, required Widget child})
      : super(
          key: key,
          notifier: model,
          child: child,
        );

  static AuthModelProvider watch(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<AuthModelProvider>();
    if (widget == null) {
      throw ErrorDescription(
          "Widget must be rendered within [AuthModelProvider]");
    }

    return widget;
  }

  static AuthModelProvider read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<AuthModelProvider>()
        ?.widget;

    if (widget == null || widget is! AuthModelProvider) {
      throw ErrorDescription(
          "Widget must be rendered within [AuthModelProvider]");
    }
    return widget;
  }
}
