import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helplines/Splash.dart';
import 'package:helplines/Info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Helpline numbers",
    theme: ThemeData(
        primarySwatch: Colors.orange, scaffoldBackgroundColor: Colors.blueGrey),
    home: Splash(),
    routes: {
      "/My": (context) => MyApp(),
      "/Info": (context) => Info(),
    },
  ));
}

_makingPhoneCall(int num) async {
  var url = 'tel:$num';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    //throw 'Could not launch $url';
    print("error occur");
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List name = [
    "NATIONAL EMERGENCY NUMBER",
    "POLICE",
    "FIRE",
    "AMBULANCE",
    "Women Helpline",
    "Women Helpline - ( Domestic Abuse )",
    "Air Ambulance",
    ""
        "Aids Helpline",
    "Anti Poison ( New Delhi )",
    "Disaster Management ( N.D.M.A )011-26701728 ",
    "EARTHQUAKE / FLOOD / DISASTER  ( N.D.R.F Headquaters)",
    "Deputy Commissioner Of Police – Missing Child And Women",
    "Railway Enquiry",
    "Senior Citizen Helpline",
    "Medical Helpline in Andhra Pradesh,  Gujarat,Uttarakhand,Goa,Tamil Nadu, Rajasthan,Karnataka,Assam,Meghalaya,M.P and U.P",
    "Railway Accident Emergency Service",
    "Road Accident Emergency Service",
    "Road Accident Emergency Service On National Highway For Private Operators",
    "ORBO Centre, AIIMS (For Donation Of Organ) Delhi",
    "Kisan Call Centre",
    "Relief Commissioner For Natural Calamities",
    "Children In Difficult Situation",
    "All India Institute of Medical Sciences (AIIMS) Poision Control ( 24*7 )",
    "Tourist Helpline",
    "LPG Leak Helpline",
    "KIRAN MENTAL HEALTH Helpline"
  ];
  List number = [
    112,
    100,
    101,
    102,
    108,
    1091,
    181,
    9540161344,
    1097,
    1066,
    1078,
    9711077372,
    1094,
    139,
    1091,
    108,
    1072,
    1073,
    1060,
    1551,
    1070,
    1098,
    01126593677,
    1363,
    1906,
    18005990019
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          " Helpline",
          style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Card(
            child: name != null
                ? ListView.builder(
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          _makingPhoneCall(number[index]);
                        },
                        onLongPress: ()
                        {

                          //final RenderSliverList box = context.findRenderObject();
                          Share.share("contact number of  ${name[index]} is ${number[index]}",
                              subject: "share via Helpline App",);
                             /* sharePositionOrigin:
                              box.localToGlobal(Offset.zero) &
                              box.size);*/
                        },
                        tileColor: Colors.orangeAccent,
                        title: Text(
                          name[index],
                          style: TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                        subtitle: Text("${number[index]}"),
                        leading: Icon(Icons.person),
                        trailing: Icon(
                          Icons.call,
                          color: Colors.green,
                        ),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}
