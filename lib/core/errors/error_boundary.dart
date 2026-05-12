import 'package:flutter/material.dart';
import 'package:sari_store/core/errors/error_screen.dart';

/// A widget that catches errors in its child subtree and displays [ErrorScreen].
class ErrorBoundary extends StatefulWidget {
  final Widget child;
  final VoidCallback? onRetry;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.onRetry,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  Object? _error;
  StackTrace? _stackTrace;

  @override
  void initState() {
    super.initState();
    // Rebuild when hot reload / retry
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return ErrorScreen(
        message: _error.toString(),
        onRetry: () {
          setState(() {
            _error = null;
            _stackTrace = null;
          });
          widget.onRetry?.call();
        },
      );
    }
    // Use Flutter's ErrorWidget builder to replace red screen
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return ErrorScreen(message: details.exceptionAsString(), onRetry: () {
        // Rebuilds the subtree
        if (mounted) {
          setState(() {});
        }
      });
    };
    return widget.child;
  }

  // We can also override didCatchError but using ErrorWidget.builder is simpler.
}