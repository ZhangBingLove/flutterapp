import 'package:flutter/material.dart';
import 'package:flutterapp/view/scaffold_widget.dart';

class LocalRouter {
  static const String SCAFFOLD_WIDGET = "scaffold_widget";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    String name = settings.name;
    print("Open page: $name");
    switch (settings.name) {
      case SCAFFOLD_WIDGET:
        return Right2LeftRouter(child: ScaffoldWidget());
    }
  }
}

class Right2LeftRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  Right2LeftRouter(
      {this.child, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (ctx, a1, a2) => child,
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              child,
            ) =>
                SlideTransition(
                  child: child,
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                ));
}
