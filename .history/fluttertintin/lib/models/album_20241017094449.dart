import 'package:flutter/material.dart';
import 'package:fluttertintin/models/gps.dart';
import 'package:fluttertintin/services/album_service.dart';

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
  final Null yearInColor;
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
