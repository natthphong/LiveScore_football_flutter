class cards {
  final time;
  final home_fault;
  final card;
  final away_fault;

  cards(
      {required this.time,
      required this.home_fault,
      required this.away_fault,
      required this.card});

  factory cards.Json(Map<String, dynamic> json) {
    return cards(
        time: json['time'],
        home_fault: json['home_fault'],
        away_fault: json['away_fault'],
        card: json['card']);
  }
  factory cards.nul(){
    return cards(time: -1, home_fault: -1, away_fault: -1, card: -1);
  }
}
