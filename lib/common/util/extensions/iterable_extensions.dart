extension IterableExtensions on Iterable {
  bool get isNotNullOrEmpty {
    return this != null && isNotEmpty;
  }

  bool get isNullOrEmpty {
    return this == null || isEmpty;
  }
}
