extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  bool isValidEmail() {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(this);
  }

  bool isValidUrl() {
    final urlRegex = RegExp(
      r'^https?://',
      caseSensitive: false,
    );
    return urlRegex.hasMatch(this);
  }

  String truncate(int length, {String ellipsis = '...'}) {
    if (this.length <= length) return this;
    return '${substring(0, length - ellipsis.length)}$ellipsis';
  }

  String toTitleCase() {
    return split(' ')
        .map((word) => word.capitalize())
        .join(' ');
  }

  bool get isBlank {
    return trim().isEmpty;
  }

  bool get isNotBlank {
    return !isBlank;
  }
}
