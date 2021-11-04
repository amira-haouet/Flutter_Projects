import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeScreen extends StatelessWidget {
// This widget is the root
// of your application

  @override
  Widget build(BuildContext context) {
    /*  return MaterialApp(
               debugShowCheckedModeBanner: false,
*/
    /*  home: Scaffold(
       
          appBar: AppBar(
             new Text('welcome to GEEC' ,style: new TextStyle(
                    color: Colors.blueGrey[600], fontWeight: FontWeight.bold , fontSize: 20.0,),),
            new Image.asset(
              'assets/images.png',
              width: 200.0,
              height: 200.0,
            ),
            ),
        
*/
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: new Text(
            'welcome to GEECVoltware',
            style: new TextStyle(
              color: Colors.blueGrey[600],
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                ' Take control of your energy usage',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20.0),
              ),
              Text(
                'Voltaware uses AI to track your energy use down to the appliance level. This enables you to get on top of your electricity bill, reduce your carbon footprint, make your home safer, monitor elderly relatives, and much more…',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int itemIndex) => Container(
                  alignment: Alignment.topCenter, // use aligment
                  child: Image.asset(
                    imageList[itemIndex],
                    fit: BoxFit.fill,
                    width: 400,
                    //height :100,
                  ),
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 3),

                  viewportFraction: 0.9,
                  //  aspectRatio: 1.0,
                  initialPage: 0,
                ),
              ),
              Container(
                child: Table(children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Voltaware sensors  ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 22.0,
                          )),
                      Text(
                          'Voltaware remotely tracks your home activity through real-time safety & security to prevent crime, unpleasant surprises and avoid potential fire hazards.',
                          textAlign: TextAlign.left)
                    ]),
                    Column(children: [
                      new Image.asset(
                        'assets/volt.jpg',
                        width: 120.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      new Image.asset(
                        'assets/b.png',
                        width: 120.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ]),
                    Column(
                      children: [
                        Text('Understand your energy use',
                            style: TextStyle(color: Colors.green)),
                        Text(
                            'Voltaware uses AI to deliver energy insights down to the appliance level so that you can streamline your energy usage.',
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ]),
                ]),
              ),
            ],
          ),
          /*new ListView(
        children: [
          Image.asset(
            'assets/images.png',
            width: 100.0,
            height: 100.0,
          ),
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("ADD IMAGE URL HERE"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("ADD IMAGE URL HERE"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("ADD IMAGE URL HERE"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("ADD IMAGE URL HERE"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("ADD IMAGE URL HERE"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),*/
        ));
  }
}

/*
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Text('Welcome to Geec !', style: Theme.of(context).textTheme.headline2,
        color:Colors.orange[600]),
      ),
    );
  }
}
*/
//
final List<String> imageList = [
  "assets/geec1.jpg",
  "assets/geec.jpg",
  "assets/geec3.jpg",
  "assets/sensor.png",
  "assets/oo.jpg",
];
