import 'package:flutter/material.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/data_providers/session_data_provider.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Введите логин и пароль';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;

    try {
      sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    } catch (e) {
      _errorMessage = 'Неправельный логин или пароль!';
    }
    _isAuthProgress = false;

    if (errorMessage != null) {
      notifyListeners();
      return;
    }

    if (sessionId == null) {
      _errorMessage = 'Неизвестная ошибка, повторите попытку';
      notifyListeners();
      return;
    }

    await _sessionDataProvider.setSessionId(sessionId);

    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRoutNames.mainScreen);
  }
}

// class AuthModelProvider extends InheritedNotifier {
//   final AuthModel model;
//   const AuthModelProvider({key, required this.model, required Widget child})
//       : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );

//   static AuthModelProvider watch(BuildContext context) {
//     final widget =
//         context.dependOnInheritedWidgetOfExactType<AuthModelProvider>();
//     if (widget == null) {
//       throw ErrorDescription(
//           "Widget must be rendered within [AuthModelProvider]");
//     }

//     return widget;
//   }

//   static AuthModelProvider read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<AuthModelProvider>()
//         ?.widget;

//     if (widget == null || widget is! AuthModelProvider) {
//       throw ErrorDescription(
//           "Widget must be rendered within [AuthModelProvider]");
//     }
//     return widget;
//   }
// }

// class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
//   final Model model;

//   const NotifierProvider({key, required this.model, required Widget child})
//       : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );

//   static Model watch<Model extends ChangeNotifier>(BuildContext context) {
//     final widget =
//         context.dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>();
//     if (widget == null) {
//       throw ErrorDescription(
//           "Widget must be rendered within [AuthModelProvider]");
//     }

//     return widget.model;
//   }

//   static Model read<Model extends ChangeNotifier>(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
//         ?.widget;

//     if (widget == null || widget is! NotifierProvider<Model>) {
//       throw ErrorDescription(
//           "Widget must be rendered within [AuthModelProvider]");
//     }
//     return widget.model;
//   }
// }
