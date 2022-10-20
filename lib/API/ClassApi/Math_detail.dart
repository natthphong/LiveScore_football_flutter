class Math_detail {
  final time;
  final home_scorer;
  final home_assist;
  final score;
  final away_scorer;
  final away_assist;

  Math_detail({required this.time,
    required this.home_scorer,
    required this.home_assist,
    required this.score,
    required this.away_scorer,
    required this.away_assist});

  factory Math_detail.Json(Map<String , dynamic> json){
    return Math_detail(time: json['time'],
        home_scorer: json['home_scorer'],
        home_assist: json['home_assist'],
        score : json['score'],
        away_scorer: json['away_scorer'],
        away_assist: json['away_assist']);
  }

  factory Math_detail.nul(){
    return Math_detail(time: -1, home_scorer: -1, home_assist: -1, score: -1, away_scorer: -1, away_assist: -1);
  }
}
