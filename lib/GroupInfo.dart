class GroupInfo {
  final String district;
  final String geoHash;
  final List<dynamic> types;

  GroupInfo(this.district, this.geoHash, this.types);

  @override
  String toString() {
    return 'PriceLog{district: $district, geoHash: $geoHash, types: $types}';
  }

  factory GroupInfo.fromJson(Map<String, dynamic> json) =>
      GroupInfo(json['district'], json['geoHash'], json['types']);
}
