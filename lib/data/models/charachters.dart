class Charachter {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> apperanceOfSessons;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulApperance;

  Charachter.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nickName = json["nickname"];
    image = json["img"];
    jobs = json["occupation"];
    statusIfDeadOrAlive = json["status"];
    apperanceOfSessons = json["appearance"];
    actorName = json["portrayed"];
    categoryForTwoSeries = json["category"];
    betterCallSaulApperance = json["better_call_saul_appearance"];
  }
}
