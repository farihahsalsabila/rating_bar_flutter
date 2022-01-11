import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  late final _ratingController;
  late double _rating;

  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isVertical = false;
  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Rating Bar'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Rating Bar',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0,
                ),),
              SizedBox(
                height: 20.0,
              ),
              _ratingBar(_ratingBarMode),
              SizedBox(height: 20.0),
              Text(
                'Rating: $_rating',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ratingBar(int mode) {
    return RatingBar.builder(
      initialRating: _initialRating,
      minRating: 1,
      direction: _isVertical ? Axis.vertical : Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 50.0,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) =>
          Icon(
            _selectedIcon ?? Icons.star,
            color: Colors.amber,
          ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      updateOnDrag: true,
    );
  }
}