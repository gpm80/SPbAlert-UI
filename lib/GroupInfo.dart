
class GroupInfo {
  final String geoHash;
  final List<dynamic> types;

  GroupInfo(this.geoHash, this.types);

  @override
  String toString() {
    return 'PriceLog{geoHash: $geoHash, types: $types}';
  }

  factory GroupInfo.fromJson(Map<String, dynamic> json) =>
      GroupInfo(json['geoHash'], json['types']);
}
