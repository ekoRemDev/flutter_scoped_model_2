import 'package:flutter/material.dart';
import 'package:flutter_scoped_model/Model/donationModel.dart';
import 'package:scoped_model/scoped_model.dart';


class DonationModelScreen extends StatefulWidget {
  @override
  _DonationModelScreenState createState() => _DonationModelScreenState();
}

class _DonationModelScreenState extends State<DonationModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=639&q=80"))),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              shadowColor: Color(0x802196f3),

              child: ScopedModelDescendant<DonationModel>(
                builder: (context,child,model){
                  if (model.donateClicked) {
                    return _buildContent(model);
                  }else{
                    return _buildInitContent(model);
                  }
                },
              ),

            )
          ],
        ),
      ),
    );
  }



  Widget _buildContent(DonationModel model){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.40,
        child: Column(
          children: <Widget>[
            _thankYouText(model),
            _backButton(model),
          ],
        ),
      ),
    );
  }

  Widget _thankYouText(DonationModel model){
    return Padding(
      padding: EdgeInsets.only(top: 10,left: 20,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Dog Says',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(height: 10,),

          Text(
            'Thank You for Donating \u0024 ${model.count}',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.normal
            ),
          ),



        ],
      ),
    );
  }

  Widget _backButton(DonationModel model){
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            textColor: Colors.white,
            color: Colors.amber,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Donate More", style: TextStyle(fontSize: 24.0),),
                  Icon(Icons.stars,color: Colors.white, size: 30,)
                ],
              ),
            ),
            onPressed: (){
              model.donateClicked = false;
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          )
        ],
      ),
    );
  }



  Widget _buildInitContent(DonationModel model){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.40,
        child: Column(
          children: <Widget>[
            _titleContainer(),
            _priceContainer(model),
            _donateContainer(model),
          ],
        ),
      ),
    );
  }

  Widget _titleContainer(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10,left: 20,bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dog Name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 10,),

                Text(
                  'Dogs are Helpfull and Cute',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                  ),
                ),



              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceContainer(DonationModel model){
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){
              model.decrement();
            },
            child: Icon(Icons.file_download, color: Colors.orange,size: 30,),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blueGrey[700],
            padding: EdgeInsets.all(10),
          ),

          Text('\u0024 ${model.count}', style: TextStyle(fontSize: 44,color: Colors.black),),

          RawMaterialButton(
            onPressed: (){
              model.increment();
            },
            child: Icon(Icons.file_upload, color: Colors.orange,size: 30,),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blueGrey[900],
            padding: EdgeInsets.all(10),
          ),

        ],
      ),
    );
  }

  Widget _donateContainer(DonationModel model){
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            textColor: Colors.white,
            color: Colors.amber,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Donate", style: TextStyle(fontSize: 24.0),),
                  Icon(Icons.stars,color: Colors.white, size: 30,)
                ],
              ),
            ),
            onPressed: (){
              model.donateClicked = true;
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
          )
        ],
      ),
    );
  }



}
