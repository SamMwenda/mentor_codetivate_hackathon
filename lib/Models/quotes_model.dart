class QuotesModel {
  final String quote;
  final String author;
  QuotesModel({required this.quote, required this.author});
}

List<QuotesModel> quotes = [
  QuotesModel(
      quote:
          '“Tell me and I forget.\nTeach me and I may remember.\nInvolve me and I learn.”',
      author: "Benjamin Franklin"),
  QuotesModel(
      quote: '“In learning,you will teach,\nand in teaching,you will learn.”',
      author: "Phil Collins"),
  QuotesModel(
      quote:
          '“Mentoring is a brain to pick,\nan ear to listen,\nand a push in the right direction.”',
      author: "John C. Crosby"),
  QuotesModel(
      quote:
          '“You cannot teach a man anything.\nYou can only help him discover it within himself” ',
      author: " Galileo Galilei"),
  QuotesModel(
      quote:
          '“The greatest good you can do for another\n is not just to share your riches but\n to reveal to him his own”',
      author: "Benjamin Disraeli"),
];
