import 'package:flutter/material.dart';

class Mentor {
  final String name;
  final String image;
  final String carrer;
  final Color color;

  Mentor(
      {required this.name,
      required this.carrer,
      required this.image,
      required this.color});
}

List<Mentor> mentors = [
  Mentor(
      name: "Felicia Jameson",
      carrer: "Product manager",
      image: "assets/profiles/8.png",
      color: const Color.fromRGBO(159, 231, 245, 1.0)),
  Mentor(
    name: "Sammy Mwenda",
    carrer: "CTO Nisa",
    image: "assets/profiles/3.png",
    color: const Color.fromRGBO(242, 127, 12, 1.0),
  ),
  Mentor(
      name: "Ajib Hussein",
      carrer: "Senior Developer",
      image: "assets/profiles/11.png",
      color: const Color.fromRGBO(66, 158, 189, 1.0)),
  Mentor(
    name: "Alicia Smith",
    carrer: "Electrical Engineer",
    image: "assets/profiles/19.png",
    color: const Color.fromRGBO(159, 231, 245, 1.0),
  ),
  Mentor(
    name: "Dr Edward Amat",
    carrer: "Mentor/Advisor",
    image: "assets/profiles/15.png",
    color: const Color.fromRGBO(247, 173, 25, 1.0),
  ),
  Mentor(
      name: "Samanth Gate",
      carrer: "UI/UX Designer",
      image: "assets/profiles/13.png",
      color: const Color.fromRGBO(66, 158, 189, 1.0)),
];
