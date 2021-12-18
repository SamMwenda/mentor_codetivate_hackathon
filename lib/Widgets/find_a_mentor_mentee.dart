import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FindMentorMenteeItem extends StatelessWidget {
  const FindMentorMenteeItem(this.color,{Key? key}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Stack(children: [
      Container(
        height: _height / 100 * 20,
        width: _width / 100 * 20,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: CachedNetworkImage(
            imageUrl: 'gs://mentor-5e2d9.appspot.com/profile/10.png',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: Colors.white),
            fadeOutDuration: const Duration(seconds: 1),
            fadeInDuration: const Duration(seconds: 3),
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.only(top: (100 / 720) * _height),
        child: Container(
          height: _height / 100 * 20,
          width: _width / 100 * 20,
          padding: EdgeInsets.all(((10 / 720) * _height)),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                width: 2,
                color: color,
              ),
              borderRadius: BorderRadius.circular((20 / 720) * _height)),
        ),
      )
    ]);
  }
}
