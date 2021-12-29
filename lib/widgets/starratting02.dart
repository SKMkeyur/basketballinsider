import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class StarRating02 extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final double size;

  StarRating02({this.starCount = 5, this.rating = .0, required this.onRatingChanged,  required this.color, required this.size});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(

        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: size,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: Colors.yellow,
        size: size,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: Colors.yellow,
        size: size,


      );
    }
    return Container(

      child: Row(
        children: [
          InkResponse(
            onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
            child: Row(
              children: [
                icon,
              ],
            ),
          ),


          //Text("4.5")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(starCount, (index) => buildStar(context, index)),

    );
  }
}