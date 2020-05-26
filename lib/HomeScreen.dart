import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutorial_travel_app/widgets/destination_carousel.dart';
import 'package:tutorial_travel_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: icons
                  .asMap()
                  .entries
                  .map(
                    (map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

// Using Theme Of colors for primary & accent colors
// All local functions & variables are private
// No Column under root-parent ListView
// Row --> Main Axis Alignment = spaceBetween will push widgets to the start and end; leaving max space in between

// Carousel
// 1) First get the scrolling functionality working then work on UI aspect
// Example: List View --> Container --> Align spacing between cards --> Then focus on design of card
// 2) Stack  --> Alignment.topCenter // shifts everything to the center
// 3) Border Radius to images --> wrap with ClipRRect widget
// 4) Positioned:
// bottom -> distance container widget is going to be from the bottom of the stack;
// top -> distance container widget is going to be from top of the stack, etc...

// hotel_carousel
// 1) SizedBox.shrink() for title property

// Prevent overflow of text in card
// by wrapping in Container and giving fixed width
// and set maxLines property to 2 or 3 to limit number of lines overflow
// Show ... if text is still overflowing by adding the 'overflow: TextOverflow.ellipsis' property

// Use Positioned to detemine size of container without explicitly giving height, but stating how much from top and bottom
