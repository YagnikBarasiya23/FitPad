class CalTile {
  const CalTile({required this.title, required this.leading});
  final String leading;
  final String title;
  static const List<CalTile> getCalData = [
    CalTile(title: 'Body Mass Index', leading: 'BMI'),
    CalTile(title: 'Basal Metabolic Rate', leading: 'BMR'),
    CalTile(title: 'Body Fat Percentage', leading: 'BFP'),
    CalTile(title: 'Ideal Body Weight', leading: 'IBW'),
    CalTile(title: 'Waist-Hip ratio', leading: 'WHR'),
    CalTile(title: 'A Body Shape Index', leading: 'ABSI'),
  ];
}
