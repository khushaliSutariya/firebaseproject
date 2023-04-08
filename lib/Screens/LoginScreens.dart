import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreens extends StatefulWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(

                  onPressed: () async {

                    final GoogleSignIn googleSignIn = GoogleSignIn();
                    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
                    if (googleSignInAccount != null) {
                      final GoogleSignInAuthentication googleSignInAuthentication =
                      await googleSignInAccount.authentication;
                      final AuthCredential authCredential = GoogleAuthProvider.credential(
                          idToken: googleSignInAuthentication.idToken,
                          accessToken: googleSignInAuthentication.accessToken);

                      // Getting users credential
                      UserCredential result = await auth.signInWithCredential(authCredential);
                      User? user = result.user;
                      var name = user!.displayName.toString();
                      var email = user!.email.toString();
                      var photo = user!.photoURL.toString();
                      var googleid = user!.uid.toString();


                      print("Name : "+name);
                      print("Email : "+email);
                      print("photo : "+photo);
                      print("id : "+googleid);

                      //Redirection

                    }


                  }, child: Text("Login with google")))
        ],
      ),
    );
  }
}
