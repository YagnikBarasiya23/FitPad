class MusclesModel {
  final String name;
  const MusclesModel({required this.name});
  static const List<MusclesModel> getMusclesData = [
    MusclesModel(name: 'BICEPS'),
    MusclesModel(name: 'FOREARMS'),
    MusclesModel(name: 'CHEST'),
    MusclesModel(name: 'ABS'),
    MusclesModel(name: 'LEGS'),
    MusclesModel(name: 'BACK'),
    MusclesModel(name: 'SHOULDERS'),
    MusclesModel(name: 'TRICEPS'),
  ];
}
