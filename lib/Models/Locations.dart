import 'dart:convert';
import 'package:http/http.dart' as http;

List<Schools> schoolsFromJson(String str) =>
    List<Schools>.from(json.decode(str).map((x) => Schools.fromJson(x)));

String schoolsToJson(List<Schools> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schools {
  Schools({
    this.province,
    this.officialInstitutionName,
    this.phasePed,
    this.gisLongitude,
    this.gisLatitude,
    this.telephone,
    this.learners2018,
    this.educator2018,
  });

  Province province;
  String officialInstitutionName;
  PhasePed phasePed;
  String gisLongitude;
  String gisLatitude;
  String telephone;
  String learners2018;
  String educator2018;

  factory Schools.fromJson(Map<String, dynamic> json) => Schools(
        province: provinceValues.map[json["Province"]],
        officialInstitutionName: json["Official_Institution_Name"],
        phasePed: phasePedValues.map[json["Phase_PED"]],
        gisLongitude: json["GIS_Longitude"],
        gisLatitude: json["GIS_Latitude"],
        telephone: json["Telephone"],
        learners2018: json["Learners_2018"],
        educator2018: json["Educator_2018"],
      );

  Map<String, dynamic> toJson() => {
        "Province": provinceValues.reverse[province],
        "Official_Institution_Name": officialInstitutionName,
        "Phase_PED": phasePedValues.reverse[phasePed],
        "GIS_Longitude": gisLongitude,
        "GIS_Latitude": gisLatitude,
        "Telephone": telephone,
        "Learners_2018": learners2018,
        "Educator_2018": educator2018,
      };
}

enum PhasePed {
  PRIMARY_SCHOOL,
  COMBINED_SCHOOL,
  SECONDARY_SCHOOL,
  PRE_PRIMARY_SCHOOL,
  INTERMEDIATE_SCHOOL,
  EMPTY,
  SPECIAL_NEEDS_EDUCATION_SCHOOL
}

final phasePedValues = EnumValues({
  "COMBINED SCHOOL": PhasePed.COMBINED_SCHOOL,
  "": PhasePed.EMPTY,
  "INTERMEDIATE SCHOOL": PhasePed.INTERMEDIATE_SCHOOL,
  "PRE-PRIMARY SCHOOL": PhasePed.PRE_PRIMARY_SCHOOL,
  "PRIMARY SCHOOL": PhasePed.PRIMARY_SCHOOL,
  "SECONDARY SCHOOL": PhasePed.SECONDARY_SCHOOL,
  "SPECIAL NEEDS EDUCATION SCHOOL": PhasePed.SPECIAL_NEEDS_EDUCATION_SCHOOL
});

enum Province { EC, FS, GT, KZN, LP, MP, NC, NW, WC }

final provinceValues = EnumValues({
  "EC": Province.EC,
  "FS": Province.FS,
  "GT": Province.GT,
  "KZN": Province.KZN,
  "LP": Province.LP,
  "MP": Province.MP,
  "NC": Province.NC,
  "NW": Province.NW,
  "WC": Province.WC
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class Convertation {
  String subServiceUrl = "https://miloo.paperpkjobs.website/schoolsapp.json";

  Future<List<Schools>> getSalonSubService() async {
    final response = await http.get(subServiceUrl);
    if (200 == response.statusCode) {
      List<Schools> salonSubServices = schoolsFromJson(response.body);
      return salonSubServices;
    } else {
      return List<Schools>();
    }
  }
}
