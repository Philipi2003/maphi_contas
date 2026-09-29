import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInServiceAdapter {
  GoogleSignInServiceAdapter({required this.googleSignInInstance});

  final GoogleSignIn googleSignInInstance;
  static const List<String> scopes = [
    'https://www.googleapis.com/auth/spreadsheets'
  ];

  void initialize(){
    
  }
}
