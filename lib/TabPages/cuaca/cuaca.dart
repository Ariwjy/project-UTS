class Cuaca {
  final String name;
  final String description;
  final String icon;
  final double temp;
  Cuaca({this.name = '', this.description = '', this.icon = '', this.temp = 0});

  factory Cuaca.fromJson(Map<String, dynamic> json) {
    return Cuaca(
        name: json['name'] ?? '',
        description: json['cuaca'][0]['description'] ?? '',
        icon: json['cuaca'][0]['icon'] ?? '',
        temp: json['main']['temp'] ?? 0);
  }
}
