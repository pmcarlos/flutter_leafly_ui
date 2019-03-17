import 'package:flutter/material.dart';

class PlantList extends StatefulWidget {
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  ScrollController _scrollController;

  final List _descriptions = [
    'Popularized by Jimi Hendrix’s 1967 classic, Purple Haze delivers a dreamy burst of euphoria that brings veteran consumers back to their psychedelic heyday.',
    'Sour Diesel, sometimes called Sour D, is an invigorating sativa-dominant strain named after its pungent, diesel-like aroma. This fast-acting strain delivers energizing, dreamy cerebral effects that have pushed Sour Diesel to its legendary status.',
    'Pineapple Express combines the potent and flavorful forces of parent strains Trainwreck and Hawaiian. The smell is likened to fresh apple and mango, with a taste of pineapple, pine, and cedar.'
  ];

  String _description;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_changeDesc);
    setState(() {
      _description = _descriptions[0];
    });
    print(_description);
  }

  _changeDesc() {
    var value = _scrollController.offset.round();
    var descriptionIndex = (value / 260.0).round();
    setState(() {
      _description = _descriptions[descriptionIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              buildPlantCard(
                'assets/1.png',
                '10',
                'OUTDOOR',
                'Purple Haze',
              ),
              SizedBox(
                width: 25.0,
              ),
              buildPlantCard(
                'assets/2.png',
                '25',
                'INDOOR',
                'Sour Diesel',
              ),
              SizedBox(
                width: 25.0,
              ),
              buildPlantCard(
                'assets/3.png',
                '22',
                'INDOOR',
                'Pineapple Express',
              ),
              SizedBox(
                width: 55.0,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            'Description',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _description != null
            ? Padding(
                padding: EdgeInsets.only(left: 25.0, top: 10.0),
                child: Text(
                  _description,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  buildPlantCard(
      String imgPath, String price, String plantType, String plantName) {
    return Stack(
      children: <Widget>[
        Container(
          height: 325.0,
          width: 250.0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF399D63)),
            height: 260.0,
            width: 250.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'FROM',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8AC7A4),
                          ),
                        ),
                        Text(
                          '\$ $price',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.0,
                    )
                  ],
                ),
                Image(
                  image: AssetImage(imgPath),
                  height: 155,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 25.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          plantType,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8AC7A4),
                          ),
                        ),
                        Text(
                          plantName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25.0,
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF8AC7A4),
                            style: BorderStyle.solid,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.transparent),
                      child: Icon(
                        Icons.wb_sunny,
                        color: Colors.white.withOpacity(0.4),
                        size: 20.0,
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF8AC7A4),
                            style: BorderStyle.solid,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.transparent),
                      child: Icon(
                        Icons.wb_incandescent,
                        color: Colors.white.withOpacity(0.4),
                        size: 20.0,
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF8AC7A4),
                            style: BorderStyle.solid,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.transparent),
                      child: Icon(
                        Icons.blur_on,
                        color: Colors.white.withOpacity(0.6),
                        size: 20.0,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        child: Icon(
                          Icons.help_outline,
                          color: Colors.white.withOpacity(0.4),
                          size: 25.0,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 80.0, top: 297.5),
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.black,
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
