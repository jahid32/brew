import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String _currentName;
  String currentSugars;
  int _currenStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
            'Update your brew settings',
          style: TextStyle(fontSize: 18.0),
        ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (val) => val.isEmpty ? 'Enter Your name' : null,
              decoration: textInputDecoration.copyWith(hintText: 'Your Name' ),
              onChanged: (val) {
                setState(() {
                  _currentName = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
