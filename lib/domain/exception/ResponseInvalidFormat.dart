class RersponseInvalidFormat implements Exception {
  final String message;

  RersponseInvalidFormat(this.message);

  @override
  String toString() => message;
}
