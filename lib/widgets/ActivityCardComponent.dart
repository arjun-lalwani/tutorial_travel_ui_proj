import 'package:flutter/material.dart';

import '../activity_model.dart';
import '../constants.dart';
import '../destination_model.dart';

class ActivityCardComponent extends StatelessWidget {
  final Destination destination;
  ActivityCardComponent({this.destination});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 10.0),
        itemCount: destination.activities.length,
        itemBuilder: (context, index) {
          Activity activity = destination.activities[index];
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                height: 170,
                width: double.infinity,
                decoration: kDestinationCardStyle,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _createCardInfoDetails(activity),
                      Text(
                        activity.type,
                        style: TextStyle(color: Colors.grey),
                      ),
                      _buildRatingStars(activity.rating),
                      SizedBox(
                        height: 10,
                      ),
                      _createCardTimeDetails(activity, context),
                    ],
                  ),
                ),
              ),
              _createCardImage(activity),
            ],
          );
        },
      ),
    );
  }

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  Widget _createCardImage(Activity activity) {
    return Positioned(
      left: 20.0,
      bottom: 15,
      top: 15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          width: 110,
          image: AssetImage(activity.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _createCardTimeDetails(Activity activity, BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(18),
          ),
          alignment: Alignment.center,
          child: Text(activity.startTimes[0]),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(
          width: 70,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(18),
          ),
          alignment: Alignment.center,
          child: Text(activity.startTimes[1]),
        ),
      ],
    );
  }

  Widget _createCardInfoDetails(Activity activity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 120,
          child: Text(
            activity.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Column(
          children: [
            Text(
              '\$${activity.price}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'per pax',
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ],
    );
  }
}
