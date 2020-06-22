import 'package:toothly/services/auth.dart';

class User {

  final String uid;
  String role;

  User({this.uid}) {
    _getRole();
  }

  _getRole() async {
    this.role = await AuthService().currentRole;
  }
}
class UserData{

  final String uid;
  String firstname;
  String surname;
  String email;
  String photoUrl;
  String phoneNumber;
  DateTime birthDate;
  int age;
  String gender;
  bool hasAllergies;
  int role;
  String details;
  String degree;
  String licenseNumber;

  UserData({this.uid, this.firstname, this.surname, this.email, this.photoUrl,
      this.phoneNumber, this.birthDate, this.age, this.gender,
      this.hasAllergies, this.role, this.details, this.degree,this.licenseNumber});



}

class PersonnelData{
  final String uid;
  String firstname;
  String surname;
  String email;
  String phoneNumber;
  String photoUrl;
  int role;
  bool isAdmin=false;
  String degree;
  String licenseNumber;

  PersonnelData({this.uid, this.firstname, this.surname, this.email,
      this.phoneNumber, this.photoUrl, this.role, this.isAdmin, this.degree,
      this.licenseNumber});


}
