import 'package:flutter/material.dart';
import 'package:tutorial_travel_app/activity_model.dart';
import 'package:tutorial_travel_app/constants.dart';
import 'package:tutorial_travel_app/destination_model.dart';
import 'package:tutorial_travel_app/widgets/ActivityCardComponent.dart';
import 'package:tutorial_travel_app/widgets/BgImageComponent.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({this.destination});
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BgImageComponent(
            destination: widget.destination,
            context: context,
          ),
          ActivityCardComponent(destination: widget.destination),
        ],
      ),
    );
  }
}
