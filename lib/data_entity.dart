class DataEntity {
  const DataEntity({
    required this.one,
    required this.two,
    required this.dateTime,
  });

  final String one;
  final String two;
  final DateTime dateTime;

  Map<String, String> toMap() {
    return {'one': one, 'two': two, 'dateTime': dateTime.toString()};
  }
}
