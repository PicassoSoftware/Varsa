import 'package:FrontendBranchOffice/assets/const.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'package:flutter/material.dart';

class Rezervation extends StatefulWidget {
  const Rezervation({Key? key}) : super(key: key);

  @override
  _RezervationState createState() => _RezervationState();
}

class _RezervationState extends State<Rezervation> {
  bool _onEditing = true;
  late String _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[Container()],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogoPath,
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      backgroundColor: kBackgroundColor ,
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Enter your code',
                style: TextStyle(fontSize: 20.0, color: Color(0xFF157575)),
              ),
            ),
          ),
          VerificationCode(
            textStyle: TextStyle(fontSize: 20.0, color: kPrimaryColor),
            keyboardType: TextInputType.number,
            // in case underline color is null it will use primaryColor: Colors.red from Theme
            underlineColor: Colors.amber,
            length: 5,
            // clearAll is NOT required, you can delete it
            // takes any widget, so you can implement your design
            clearAll: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'clear all',
                style: TextStyle(
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor),
              ),
            ),
            onCompleted: (String value) {
              setState(() {
                _code = value;
              });
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: _onEditing
                  ? const Text('Please enter full code')
                  : Text('Your code: $_code'),
            ),
          )
        ],
      ),
    );
  }
}