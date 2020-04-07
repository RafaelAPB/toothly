import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toothly/models/user.dart';
import 'package:toothly/screens/settings/settings_form.dart';
import 'package:toothly/services/database.dart';
import 'package:toothly/shared/colors.dart';
import 'package:toothly/shared/constants.dart';
import 'package:toothly/shared/loading.dart';

class MyProfile extends StatelessWidget {
  var _profileTextStyle= TextStyle(
      fontSize: 15.0, color: Colors.black,
  );
  var upBar;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 60.0,
              ),
              child: SettingsForm(),
            );
          });
    }
     upBar=AppBar(
      title: Text('My Profile'),
      backgroundColor: Swatches.myPrimaryMint,
      elevation: 0.0,
      actions: <Widget>[
        FlatButton.icon(
            onPressed: () => _showSettingsPanel(),
            icon: Icon(Icons.edit),
            label: Text('Edit')),
      ],
    );



    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return profileAppearance(userData);
        } else {
          return Loading();
        }
      },
    );
  }

  Scaffold profileAppearance (UserData userData){
    return Scaffold(
      appBar: upBar,
      body: Column(
        children: <Widget>[
          Text(
            'First Name: '+userData.firstname,
            style: _profileTextStyle ,
          ),
          Text(
            'Surname: '+userData.surname,
            style: _profileTextStyle ,
          ),
          Text(
            'Age: '+userData.age.toString(),
            style: _profileTextStyle ,
          ),
          Text(
            'Role: '+userData.role,
            style: _profileTextStyle ,
          ),
        ],
      ) ,
      bottomNavigationBar: bottomBar,
    );


  }
}
