import 'package:ecohub_app/services/auth.dart';
import 'package:ecohub_app/main.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
class EventViewOrganizer extends StatelessWidget {
  const EventViewOrganizer({
    Key key,
    this.auth,
    this.userId,
    @required this.imgUrl,
    @required this.title,
    @required this.description,
    @required this.date,
    @required this.hours,
    @required this.organizer,
    @required this.location,
    @required this.myapp,
  }) : super(key: key);

  final BaseAuth auth;
  final MyAppState myapp;
  final String userId;
  final String imgUrl, title, description, date, hours, organizer, location;



  @override
  Widget build(BuildContext context) {
    print("URL: ${this.imgUrl}");
    void getUserLocation() async {//call this async method from whereever you need

      final coordinates = new Coordinates(29.791081, -95.808231);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      print('ADRESSADRESSASDEAASDASDASD ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare} ADRESSADRESSASDEAASDASDASD');
   //   return first;
    }
    getUserLocation();



    Widget volunteerRow(String name, String p1, String p2)
    {


    return new Container(


                  child: Row
                    (mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>
                    [
                      Expanded
                        (
                        child: FittedBox
                          (
                          fit: BoxFit.scaleDown,
                          child: FloatingActionButton
                            (
                              child: const Icon(Icons.cancel),
                              backgroundColor: Colors.red,
                              onPressed: () {}
                          ),
                        ),
                      ),

                      Expanded
                        (
                        child: FittedBox
                          (
                          fit: BoxFit.contain,
                          // otherwise the logo will be tiny
                          child: Image
                            (
                            image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
                            ),
                          ),
                        ),
                      ),
                      Expanded
                        (
                        child: FittedBox
                          (
                          fit: BoxFit.contain,
                          // otherwise the logo will be tiny
                          child: Text("USERNAME"),
                        ),
                      ),

                      Expanded
                        (
                        child: FittedBox
                          (
                          fit: BoxFit.contain,
                          // otherwise the logo will be tiny
                          child: Image
                            (
                            image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                          ),
                        ),
                      ),
                      Expanded
                        (
                        child: FittedBox
                          (
                          fit: BoxFit.scaleDown,
                          child: FloatingActionButton
                            (
                              child: const Icon(Icons.check),
                              backgroundColor: Colors.green,
                              onPressed: () {}
                          ),
                        ),
                      ),

                    ],
                  ),


    );




    }
    Widget volunteerList()
    {
      List<Widget> ll = new List<Widget>();
      for(int x=0;x<3;x++)
      {
        Widget w = volunteerRow("name","name","name");
        ll.add(w);
      }
      return new Column(children: ll);
    }

    return Stack(

      children: <Widget>[
        Scaffold(
          body: ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.85,
                      child:  Image(
                        image: NetworkImage(this.imgUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.black.withAlpha(0),
                            Colors.black12,
                            Colors.black45
                          ],
                        ),
                      ),
                      child: Text(
                        '${this.title}',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'SCROLL UP',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(192, 192, 192, 1)
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0, 2),
                  child: Text(
                    '${this.hours}',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,5,0, 20),
                  child: Text(
                    'HOURS',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(192, 192, 192, 1)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'DESCRIPTION',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(192, 192, 192, 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
                child: Text(
                  '${this.description}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 60),
                child: Text(
                  'MAP',
                  style: TextStyle(
                      fontSize: 20,

                      color: Color.fromRGBO(192, 192, 192, 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 60),

                child: Text(
                  'Volunteer List',
                  style: TextStyle(
                      fontSize: 20,

                      color: Color.fromRGBO(192, 192, 192, 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 60),

                child: volunteerList(),
              ),



            ],
          ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: FloatingActionButton(
              child: const Icon(Icons.cancel),
              backgroundColor: Colors.red,

              onPressed: (){
                print("Cancel");
                myapp.changePage(PageType.DASHBOARD);
              }
          ),
        ),
      ],
    );
  }
}


