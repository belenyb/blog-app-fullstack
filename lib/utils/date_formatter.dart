getFormattedDate(DateTime date) {
  List<String> months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];
  final splittedDate = date.toIso8601String().split('T').first;
  final year = splittedDate.split('-').first;
  final month = months.elementAt(int.parse(splittedDate.split('-')[1]));
  final day = splittedDate.split('-')[2];

  return "$day ${month.substring(0, 3)}, $year";
}
