import 'package:flutter/material.dart';

class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;

  const NotifierProvider({key, required this.model, required Widget child})
      : super(
          key: key,
          notifier: model,
          child: child,
        );

  static Model watch<Model extends ChangeNotifier>(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>();
    if (widget == null) {
      throw ErrorDescription(
          "Widget must be rendered within [NotifierProvider]");
    }

    return widget.model;
  }

  static Model read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.widget;

    if (widget == null || widget is! NotifierProvider<Model>) {
      throw ErrorDescription(
          "Widget must be rendered within [NotifierProvider]");
    }
    return widget.model;
  }
}

class Provider<Model> extends InheritedWidget {
  final Model model;
  const Provider({
    key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static Model watch<Model>(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<Provider<Model>>();
    if (widget == null) {
      throw ErrorDescription(
          "Widget must be rendered within [NotifierProvider]");
    }

    return widget.model;
  }

  static Model read<Model>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<Provider<Model>>()
        ?.widget;

    if (widget == null || widget is! Provider<Model>) {
      throw ErrorDescription(
          "Widget must be rendered within [NotifierProvider]");
    }
    return widget.model;
  }

  @override
  bool updateShouldNotify(covariant Provider oldWidget) {
    return model != oldWidget.model;
  }
}
