import 'package:flutter/material.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive) {
      // Close the database when app is paused or inactive

    } else if (state == AppLifecycleState.resumed) {
      // Reopen the database when app resumes

    }
  }
}
