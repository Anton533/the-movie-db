import 'package:flutter/material.dart';

class NotifierProvider<Model extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final bool isManagingModel;
  final Model Function() create;

  const NotifierProvider({
    super.key,
    required this.create,
    this.isManagingModel = true,
    required this.child,
  });

  @override
  _NotifierProviderState<Model> createState() =>
      _NotifierProviderState<Model>();

  static Model watch<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<
        _InheritedNotifierProvider<Model>>();
    if (widget == null) {
      throw ErrorDescription(
          "Widget must be rendered within [NotifierProvider]");
    }

    return widget.model;
  }

  static Model read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            _InheritedNotifierProvider<Model>>()
        ?.widget;

    if (widget == null || widget is! _InheritedNotifierProvider<Model>) {
      throw ErrorDescription(
          "Widget must be rendered within [NotifierProvider]");
    }
    return widget.model;
  }
}

class _NotifierProviderState<Model extends ChangeNotifier>
    extends State<NotifierProvider<Model>> {
  late final Model _model;

  @override
  void initState() {
    super.initState();
    _model = widget.create();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedNotifierProvider(
      model: _model,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    if (widget.isManagingModel) {
      _model.dispose();
    }
    super.dispose();
  }
}

class _InheritedNotifierProvider<Model extends ChangeNotifier>
    extends InheritedNotifier {
  final Model model;

  const _InheritedNotifierProvider(
      {key, required this.model, required Widget child})
      : super(
          key: key,
          notifier: model,
          child: child,
        );
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
