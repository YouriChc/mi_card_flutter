import 'package:flutter/material.dart';
import 'package:mi_card/services/calls_and_messages_service.dart';
import 'package:mi_card/services/services_locator.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyApp extends StatelessWidget {
  final CallsAndMessagesService _callsAndMessagesService = locator<CallsAndMessagesService>();
  final String phone = '+33 1 23 45 67 89';
  final String email = 'avatar@gmail.com';
  final String stackOverflow = 'https://stackoverflow.com/users/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/avatar.png'),
            ),
            Text(
              'Avatar',
              style: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(
              'GUARDIAN OF NATURE',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 15,
                color: Colors.teal.shade100,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  phone,
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 15,
                  ),
                ),
                onTap: () => _callsAndMessagesService.call(phone),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.alternate_email,
                  color: Colors.teal,
                ),
                title: Text(
                  email,
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 15,
                  ),
                ),
                onTap: () => _callsAndMessagesService.sendEmail(email),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Image(
                  image: AssetImage('images/stack_overflow.png'),
                  width: 25,
                  height: 25,
                ),
                title: Text(
                  'My Stack Overflow Profile',
                  style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 15),
                ),
                onTap: () => _launchURL(stackOverflow),
              ),
            )
          ],
        )),
      ),
    );
  }
}
