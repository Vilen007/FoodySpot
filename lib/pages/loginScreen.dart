import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email'
  ]
);

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {  
   GoogleSignInAccount? _currentUser;
  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser= account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }


  Color textFieldColor = Color.fromARGB(255, 212, 218, 219);
  String _name = "";
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  CheckValidation() async{
  if(_formKey.currentState!.validate()){
   await Future.delayed(Duration(seconds: 1));
   await Navigator.pushNamed(context, '/home');  
  }

}

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/cover1.png",
              fit: BoxFit.cover,),
              SizedBox(height: 20.0),
              Text(
                "Welcome $_name",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                  
                        fillColor: textFieldColor,
                        filled: true,
                        hintText: "Enter Username",
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person),
                        errorStyle: TextStyle(color: Colors.blue,),
                        
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        else if (value.length < 3) {
                          return "Username must have 3 letters";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        this._name = value;
                        setState(() {});
                      },
                      
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        fillColor: textFieldColor,
                        filled: true,
                        hintText: "Enter Password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.enhanced_encryption),
                        
                        suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                        onPressed: () {
                          setState(() {
                              _passwordVisible = !_passwordVisible;
                          });
                        },
                        ),
                        errorStyle: TextStyle(color: Colors.blue,),
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        else if (value.length < 6) {
                          return "Password must be greater than 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.0),
                    
                    AnimatedButton.strip(
                      onPress: () => CheckValidation(),
                      width: 200,
                      height: 50,
                      backgroundColor: textFieldColor,
                      text: 'SUBMIT',
                      isReverse: true,
                      selectedTextColor: Colors.white,
                      stripTransitionType: StripTransitionType.LEFT_TO_RIGHT,
                      selectedBackgroundColor: Colors.black,
                      textStyle: GoogleFonts.nunito(
                          fontSize: 28,
                          letterSpacing: 5,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),  
                    SizedBox(height: 20.0),
                    AnimatedButton.strip(
                      onPress: () => signin(),
                      width: 250,
                      height: 60,
                      backgroundColor: textFieldColor,
                      text: 'Log in with Google',
                      isReverse: true,
                      selectedTextColor: Colors.white,
                      stripTransitionType: StripTransitionType.LEFT_TO_RIGHT,
                      selectedBackgroundColor: Colors.black,
                      textStyle: GoogleFonts.nunito(
                          fontSize: 28,
                          letterSpacing: 5,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  
                    SizedBox(height: 12.0),
                    OutlinedButton.icon(
                      icon: Icon(Icons.app_registration),
                      onPressed: ( )=> Navigator.pushNamed(context, "/register"), 
                      label: Text('Register Yourself'),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                      )
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> signin() async{
  try{
    _googleSignIn.signIn();
  }
  catch(e){
    print('Signin error $e');
  }
}