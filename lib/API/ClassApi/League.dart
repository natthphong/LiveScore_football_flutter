class League {
  final country_id;
  late final country_name;
  final league_id;
  final league_name;
  final league_season;
  final league_logo;
  final country_logo;

  League(
      {required this.country_id,
      required this.country_name,
      required this.league_id,
      required this.country_logo,
      required this.league_logo,
      required this.league_name,
      required this.league_season});

  factory League.Json(Map<String , dynamic > json) {
    return League(
        country_id: json['country_id'],
        country_name: json['country_name'],
        league_id: json['league_id'],
        country_logo: json['country_logo'],
        league_logo: json['league_logo'],
        league_name: json['league_name'],
        league_season: json['league_season']);
  }
}
