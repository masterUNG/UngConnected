import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ungconnected/models/test_model.dart';
import 'package:ungconnected/utility/my_constant.dart';
import 'package:ungconnected/widgets/show_title.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  List<TestModel> testModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllData();
  }

  Future<Null> readAllData() async {
    String path = '${MyConstant.domain}/ungConnected/getAllData.php';
    await Dio().get(path).then((value) {
      for (var item in json.decode(value.data)) {
        TestModel model = TestModel.fromMap(item);
        setState(() {
          testModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body:
          testModels.length == 0 ? CircularProgressIndicator() : buildContent(),
    );
  }

  Padding buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowTitle(title: 'Temp :', textStyle: MyConstant().h1Style()),
            buildGaugeLinear(double.parse(testModels[0].valueY)),
            buildGaugeLinear(double.parse(testModels[1].valueY)),
            buildGaugeLinear(double.parse(testModels[2].valueY)),
            ShowTitle(title: 'Presure :', textStyle: MyConstant().h1Style()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildGaugeRadial(double.parse(testModels[3].valueY)),
                buildGaugeRadial(double.parse(testModels[4].valueY)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGaugeRadial(double value) => Container(
        width: 150,
        child: SfRadialGauge(
          axes: [
            RadialAxis(
              minimum: 0,
              maximum: 25,
              pointers: [NeedlePointer(value: value)],
            ),
          ],
        ),
      );

  Widget buildGaugeLinear(double value) => SfLinearGauge(
        maximum: 25,
        markerPointers: [
          LinearShapePointer(value: value),
        ],
        ranges: [
          LinearGaugeRange(
            startValue: 0,
            endValue: value,
          )
        ],
      );
}
