class DifficultyModel {
  final String level;
  final double rating;
  const DifficultyModel({required this.level, required this.rating});
  static const List<DifficultyModel> getDifficultyData = [
    DifficultyModel(level: 'BEGINNER', rating: 2),
    DifficultyModel(level: 'INTERMEDIATE', rating: 3.5),
    DifficultyModel(level: 'EXPERT', rating: 5),
  ];
}
