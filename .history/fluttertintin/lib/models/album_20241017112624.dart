import 'package:flutter/foundation.dart';
import 'package:fluttertintin/models/gps.dart';

class Album {
  const Album(
      {required this.title,
      required this.numero,
      required this.year,
      this.yearInColor,
      required this.image,
      required this.resume,
      required this.gps,
      required this.location});

  final String title;
  final int numero;
  final int year;
  final int? yearInColor;
  final String image;
  final String resume;
  final GPS gps;
  final String location;

  void printToString() {
    print(title);
    print(numero);
    print(year);
    print(yearInColor);
    print(image);
    print(resume);
    print(gps);
    print(location);
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    final gpsString = json['gps'] as String;
    final coordinates = gpsString.split(',');
    print(coordinates);
    return Album(
      title: json['title'] as String,
      numero: json['numero'] as int,
      year: json['year'] as int,
      yearInColor:
          json['yearInColor'] != null ? json['yearInColor'] as int : null,
      image: json['image'] as String,
      resume: json['resume'] as String,
      gps: GPS(
          latitude: double.parse(coordinates[0]),
          longitude: double.parse(coordinates[1])),
      location: json['lieu'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'numero': numero,
        'year': year,
        'yearInColor': yearInColor,
        'image': image,
        'resume': resume,
        'gps': gps,
        'location': location,
      };
}
