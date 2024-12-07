class CustomNotification {
  final int id;
  final String? title;
  final String? body;
  final String? payload;
  final DateTime? date;

  CustomNotification(
      {required this.id,
      required this.title,
      required this.body,
      this.payload,
      required this.date});
}
