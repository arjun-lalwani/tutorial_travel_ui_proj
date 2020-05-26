import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutorial_travel_app/destination_model.dart';

import '../constants.dart';

class BgImageComponent extends StatelessWidget {
  final Destination destination;
  final BuildContext context;
  BgImageComponent({this.destination, this.context});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _createBgImage(destination.imageUrl),
        _createBgImageIconRow(),
        _createBgImageText(),
        _createBgImageLocationIcon(),
      ],
    );
  }

  Container _createBgImage(String imageUrl) {
    return Container(
      decoration: kHeroImageContainerStyle,
      height: MediaQuery.of(context).size.width,
      child: Hero(
        tag: imageUrl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _createBgImageIconRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createBgImageIconButton(Icon(Icons.arrow_back)),
          Row(
            children: [
              _createBgImageIconButton(Icon(Icons.search)),
              _createBgImageIconButton(Icon(FontAwesomeIcons.sortAmountDown)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createBgImageIconButton(Icon customIcon) {
    return IconButton(
      icon: customIcon,
      iconSize: 30.0,
      color: Colors.black,
      onPressed: () => Navigator.pop(context),
    );
  }

  Widget _createBgImageText() {
    return Positioned(
      bottom: 20,
      left: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            destination.city,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.locationArrow,
                size: 10.0,
                color: Colors.white70,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                destination.country,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _createBgImageLocationIcon() {
    return Positioned(
      right: 20,
      bottom: 20,
      child: Icon(
        Icons.location_on,
        color: Colors.white70,
        size: 25.0,
      ),
    );
  }
}
