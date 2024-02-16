import 'package:google_sign_in/google_sign_in.dart';

class LoginApi {
  static final _googleLogin = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() async {
    final googleUser = await _googleLogin.signIn();
    return googleUser;
  }
  static Future<GoogleSignInAccount?> logout() async {
    final googleUser = await _googleLogin.signOut();
    return googleUser;
  }
  
}
