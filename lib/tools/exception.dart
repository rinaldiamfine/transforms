class DefaultException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  DefaultException({
    this.message = 'Error loading data, check your internet!',
    this.stackTrace,
  }) {
    // ignore: avoid_print
    print(stackTrace);
  }

  @override
  String toString() => message;
}
