class GroupInfo {
  final String district;
  final String geoHash;
  final List<dynamic> types;
  final int countAlert;
  final double actual;

  GroupInfo(
      this.district, this.geoHash, this.types, this.countAlert, this.actual);

  @override
  String toString() {
    return 'GroupInfo{district: $district, geoHash: $geoHash, types: $types, countAlert: $countAlert, actual: $actual}';
  }

  factory GroupInfo.fromJson(Map<String, dynamic> json) => GroupInfo(
      json['district'],
      json['geoHash'],
      json['types'],
      json['countAlert'],
      json['actual']);
}
