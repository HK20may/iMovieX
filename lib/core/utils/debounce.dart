import 'dart:async';

class Debounce {
  /// This [_operations] holds all the debounce functions in the APP.
  // ignore: prefer_final_fields
  static Map<String, _DebounceOperation> _operations = {};

  static void call(
    String tag,
    Duration duration, {
    required Function onExecute,
  }) {
    if (duration == Duration.zero) {
      _operations[tag]?.timer.cancel();
      _operations.remove(tag);
      onExecute();
    } else {
      _operations[tag]?.timer.cancel();

      _operations[tag] = _DebounceOperation(
        onExecute,
        Timer(duration, () {
          _operations[tag]?.timer.cancel();
          _operations.remove(tag);

          onExecute();
        }),
      );
    }
  }

  /// If you want to invoke the callback and cancel the debounce timer, you must first call
  /// `fire(tag)` and then `cancel(tag)`.
  /// And also to call instantaneously any Debounce Method.
  static void fire(String tag) {
    _operations[tag]?.callback();
  }

  /// Cancels any active debounce operation with the given [tag].
  static void cancel(String tag) {
    _operations[tag]?.timer.cancel();
    _operations.remove(tag);
  }

  /// Cancels all active debouncer.
  static void cancelAll() {
    for (final operation in _operations.values) {
      operation.timer.cancel();
    }
    _operations.clear();
  }

  /// Returns the number of active debounces
  static int count() {
    return _operations.length;
  }
}

class _DebounceOperation {
  Function callback;
  Timer timer;
  _DebounceOperation(this.callback, this.timer);
}
