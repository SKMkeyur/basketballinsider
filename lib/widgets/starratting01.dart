import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class StarRating01 extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating01({this.starCount = 5, this.rating = .0, required this.onRatingChanged,  required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(

        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: 12,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: Colors.yellow,
        size: 12,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: Colors.yellow,
        size: 12,


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