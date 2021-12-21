import 'package:flutter/material.dart';

class Mentee {
  final String name;
  final String image;
  final String carrer;
  final Color color;

  Mentee(
      {required this.name,
      required this.carrer,
      required this.image,
      required this.color});
}

List<Mentee> mentees = [
  Mentee(
      name: "Nelly Jade",
      carrer: "Cloud Engineer",
      image: "assets/profiles/7.png",
      color: const Color.fromRGBO(159, 231, 245, 1.0)),
  Mentee(
    name: "Tom Evans",
    carrer: "HCI Engineer",
    image: "assets/profiles/10.png",
    color: const Color.fromRGBO(242, 127, 12, 1.0),
  ),
  Mentee(
      name: "Said Alhameri",
      carrer: "Software Engineer",
      image: "assets/profiles/9.png",
      color: const Color.fromRGBO(66, 158, 189, 1.0)),
  Mentee(
    name: "Jeff Kerrington",
    carrer: "Electrical Engineer",
    image: "assets/profiles/17.png",
    color: const Color.fromRGBO(159, 231, 245, 1.0),
  ),
  Mentee(
    name: "Sasha Gimsby",
    carrer: "Mathematics Student",
    image: "assets/profiles/12.png",
    color: const Color.fromRGBO(247, 173, 25, 1.0),
  ),
  Mentee(
      name: "Daniel Gates",
      carrer: "UI/UX Designer",
      image: "assets/profiles/4.png",
      color: const Color.fromRGBO(66, 158, 189, 1.0)),
];
