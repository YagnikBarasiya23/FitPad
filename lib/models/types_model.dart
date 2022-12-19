class CrossfitModel {
  final String name;
  const CrossfitModel({required this.name});
  static const List<CrossfitModel> getCrossfitData = [
    CrossfitModel(name: 'STRETCHING'),
    CrossfitModel(name: 'PLYOMETRICS'),
    CrossfitModel(name: 'CARDIO'),
    CrossfitModel(name: 'POWERLIFTING'),
    CrossfitModel(name: 'STRENGTH'),
  ];
}
