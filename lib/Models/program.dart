import 'package:flutter/material.dart';
import 'package:mentor_codetivate_hackathon/Models/schedule.dart';

class Program {
  final String name;
  final String publisher;
  final String image;
  final Color color;
  final List<Schedule> schedule;
  Program(
      {required this.color,
      required this.name,
      required this.image,
      required this.publisher,
      required this.schedule});
}

List<Program> programList = [
  Program(
      image: "assets/profiles/15.png",
      color: const Color.fromRGBO(247, 173, 25, 1.0),
      name: "Stellar for blockchain",
      publisher: "Dr Edward Amat",
      schedule: edwardAmat),
  Program(
      image: "assets/profiles/19.png",
      color: const Color.fromRGBO(159, 231, 245, 1.0),
      name: "Iot for the future",
      publisher: "Alicia Smith",
      schedule: aliciaSmith),
  Program(
      image: "assets/profiles/11.png",
      color: const Color.fromRGBO(66, 158, 189, 1.0),
      name: "AI with TensorFlow",
      publisher: "Ajib Hussein",
      schedule: ajibHussein),
  Program(
      image: "assets/profiles/3.png",
      color: const Color.fromRGBO(242, 127, 12, 1.0),
      name: "Intro to Flutter",
      publisher: "Sammy Mwenda",
      schedule: sammyMwenda)
];
