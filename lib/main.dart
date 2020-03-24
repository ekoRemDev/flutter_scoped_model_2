import 'package:flutter/material.dart';
import 'package:flutter_scoped_model/Model/donationModel.dart';
import 'package:flutter_scoped_model/donationModelScreen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());


DonationModel donationModel = DonationModel();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<DonationModel>(
      model: donationModel,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DonationModelScreen(),
      ),
    );
  }
}


