import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bar.dart';

class TaskHomePage extends StatefulWidget {
  @override
  _TaskHomePageState createState() {
    return _TaskHomePageState();
  }
}

class _TaskHomePageState extends State<TaskHomePage> {
  List<charts.Series<Materials, String>> _seriesPieData;
  List<Materials> mydata;
  _generateData(mydata) {
    _seriesPieData = List<charts.Series<Materials, String>>();
    _seriesPieData.add(
      charts.Series(
        domainFn: (Materials material, _) => material.materialn,
        measureFn: (Materials material, _) => material.materialVal,
        colorFn: (Materials material, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(material.colorVal))),
        id: 'materials',
        data: mydata,
        labelAccessorFn: (Materials row, _) => "${row.materialVal}",
      ),
    );
  }

  
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow[800],
              //backgroundColor: Color(0xff308e1c),
              bottom: TabBar(
                indicatorColor: Color(0xff9962D0),
                tabs: [
                  Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                  Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                ],
              ),
            ),
            body: TabBarView(
                children: [
                _buildBody(context),
               MachinesHomePage().createState().build(context)
               ],
              
          ),
        )
        ));
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('material').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Materials> material = snapshot.data.documents
              .map((documentSnapshot) => Materials.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, material);
        }
      },
    );
  }
  Widget _buildChart(BuildContext context, List<Materials> materialdata) {
    mydata = materialdata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Time spent on daily Materials',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 5),
                    behaviors: [
                      new charts.DatumLegend(
                        outsideJustification:
                            charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 2,
                        cellPadding:
                            new EdgeInsets.only(right: 4.0, bottom: 4.0,top:4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Georgia',
                            fontSize: 18),
                      )
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Materials {
  final int materialVal;
  final String materialn;
  final String colorVal;
  Materials(this.materialn, this.materialVal, this.colorVal);

  Materials.fromMap(Map<String, dynamic> map)
      : assert(map['materialn'] != null),
        assert(map['materialVal'] != null),
        assert(map['colorVal'] != null),
        materialn = map['materialn'],
        materialVal = map['materialVal'],
        colorVal = map['colorVal'];

  @override
  String toString() => "Record<$materialVal:$materialn>";
}







