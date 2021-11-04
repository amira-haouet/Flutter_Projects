import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MachinesHomePage extends StatefulWidget {
  @override
  _MachinesHomePageState createState() {
    return _MachinesHomePageState();
  }
}

class _MachinesHomePageState extends State<MachinesHomePage> {
  List<charts.Series<Machines, String>> _seriesBarData;
  List<Machines> mydata;
  _generateData(mydata) {
    _seriesBarData = List<charts.Series<Machines, String>>();
    _seriesBarData.add(
      charts.Series(
        domainFn: (Machines machines, _) => machines.consomYear.toString(),
        measureFn: (Machines machines, _) => machines.consomVal,
        colorFn: (Machines machines, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(machines.colorVal))),
        id: 'Machines',
        data: mydata,
        labelAccessorFn: (Machines row, _) => "${row.consomYear}",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('machines').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Machines> machines = snapshot.data.documents
              .map((documentSnapshot) => Machines.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, machines);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Machines> machinedata) {
    mydata = machinedata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'consomation by Year',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(
                  _seriesBarData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                  behaviors: [
                    new charts.DatumLegend(
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.purple.shadeDefault,
                          fontFamily: 'Georgia',
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Machines {
  final int consomVal;
  final String consomYear;
  final String colorVal;
  Machines(this.consomVal, this.consomYear, this.colorVal);

  Machines.fromMap(Map<String, dynamic> map)
      : assert(map['consomVal'] != null),
        assert(map['consomYear'] != null),
        assert(map['colorVal'] != null),
        consomVal = map['consomVal'],
        colorVal = map['colorVal'],
        consomYear = map['consomYear'];

  @override
  String toString() => "Record<$consomVal:$consomYear:$colorVal>";
}