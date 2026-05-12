import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'failures.dart';

/// Sets up global error handlers for the whole app.
/// Call once in main() before runApp.
class AppErrorHandler {
  AppErrorHandler._();

  static void setup() {
    // Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      // Log to file
      AppLogger.error(
        'FlutterError',
        details.exception,
        details.stack,
      );
      // In production, we may still show the red screen in debug; but we can silence it.
      if (kDebugMode) {
        FlutterError.presentError(details); // Keep default debug behaviour
      }
      // In release mode, you could show a generic error screen; we'll handle via ErrorBoundary.
    };

    // Platform-level errors (async errors that escape the tree)
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      final failure = Failure.fromException(error);
      AppLogger.fatal(
        'PlatformDispatcher error',
        failure,
        stack,
      );
      return true; // Prevent the app from crashing – but we should show a full-screen fallback
    };

    // Catch any uncaught async errors
    runZonedGuarded(
      () {
        // Nothing to run here; the app runs inside runApp in main()
      },
      (Object error, StackTrace stack) {
        AppLogger.fatal(
          'Uncaught error in zone',
          error,
          stack,
        );
      },
      zoneSpecification: ZoneSpecification(print: (self, parent, zone, line) {
        // Intercept print statements and log them
        AppLogger.debug(line);
        parent.print(zone, line);
      }),
    );
  }
}