class TopicModel {
  final String topic;
  final String imagePath;
  final String? description;
  final String? day;
  final String? yearMonth;

  TopicModel({
    required this.topic,
    required this.imagePath,
    this.description,
    this.day,
    this.yearMonth,
  });
}
