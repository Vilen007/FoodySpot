import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';


class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color textFieldColor = Color.fromARGB(255, 212, 218, 219);
  String _password = "";
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _confirmpasswordVisible = false;

  CheckValidation() async{
  if(_formKey.currentState!.validate()){
   await Future.delayed(Duration(seconds: 1));
   await Navigator.pushNamed(context, '/home');  
  }
  }

  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 8,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 32),
                child: Row(
                  
                  children: [
                  SizedBox(height: 10),
                  ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(54),
                    child: Image.asset('assets/images/cover1.png', fit: BoxFit.cover),
                  ),
                  ),
                  SizedBox(width: 12,),
                Text(
                  "Register Yourself",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  ],
                ),
              ),
             
              
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
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
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                  
                        fillColor: textFieldColor,
                        filled: true,
                        hintText: "Enter Email",
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        errorStyle: TextStyle(color: Colors.blue,),
                        
                      ),
                      validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                      // validator: (value){
                      //   if (value == null || value.isEmpty) {
                      //     return "Email cannot be empty";
                      //   }
                      //   else if (value.length < 8) {
                      //     return "Email must have 8 letters";
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                  
                        fillColor: textFieldColor,
                        filled: true,
                        hintText: "Enter Phone Number",
                        labelText: "Phone",
                        prefixIcon: Icon(Icons.phone),
                        errorStyle: TextStyle(color: Colors.blue,),
                        
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Phone Number cannot be empty";
                        }
                        else if (value.length < 11) {
                          return "Phone number must have 11 digits";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      keyboardType: TextInputType.text,
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
                      onChanged: (value) {
                        this._password = value;
                        setState(() {});
                      },
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
                    SizedBox(height: 10.0),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: !_confirmpasswordVisible,
                      decoration: InputDecoration(
                        fillColor: textFieldColor,
                        filled: true,
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.enhanced_encryption),
                        
                        suffixIcon: IconButton(
                        icon: Icon(
                          _confirmpasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),

                        onPressed: () {
                          setState(() {
                              _confirmpasswordVisible = !_confirmpasswordVisible;
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
                        else if (value != _password){
                          return "Both Password must be same";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 17.0),
                    
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
                          fontSize: 25,
                          letterSpacing: 5,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
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