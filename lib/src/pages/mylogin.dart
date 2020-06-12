import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markets/src/models/ink_well_custom.dart';
import 'package:markets/src/models/validations.dart';
import 'package:markets/src/theme/style.dart';
import 'phoneVerification.dart';
import '../../generated/l10n.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool autovalidate = false;
  Validations validations = new Validations();

  submit(){
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
    } else {
      form.save();
      //code
          Navigator.of(context).pushReplacementNamed('/OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Container(
            decoration:BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.5,8],
                    colors: [Colors.white,  Colors.lightBlueAccent[100]])),
            child: SingleChildScrollView(
                child: InkWellCustom(
                  onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(children: <Widget>[
                          Container(
                            height: 250.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage( 'assets/img/mylogo.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          new Padding(
                              padding: EdgeInsets.fromLTRB(18.0, 150.0, 18.0, 0.0),
                              child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: double.infinity,
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                          padding: EdgeInsets.only(top: 100.0),
                                          child: new Material(
                                            borderRadius: BorderRadius.circular(7.0),
                                            elevation: 5.0,
                                            child: new Container(
                                              width: MediaQuery.of(context).size.width - 20.0,
                                              height: MediaQuery.of(context).size.height *0.4,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(20.0)),
                                              child: new Form(
                                                  key: formKey,
                                                  child: new Container(
                                                    padding: EdgeInsets.all(18.0),
                                                    child: new Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          S.of(context).delivery,
                                                          style:heading35Black,textAlign: TextAlign.center,),
                                                        new Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            TextFormField(
                                                                keyboardType: TextInputType.phone,
                                                                validator: validations.validateMobile,
                                                                decoration: InputDecoration(
                                                                    border: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                    ),
                                                                    prefixIcon:
                                                                    Padding(
                                                                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                                                                      child: Icon(Icons.phone,
                                                                          color: blackColor,
                                                                          size: 20.0,

                                                                      ),
                                                                    ),
                                                                    suffixIcon: IconButton(
                                                                      icon: Icon(CupertinoIcons.clear_thick_circled,color: greyColor2,),
                                                                      onPressed: (){
                                                                      },
                                                                    ),
                                                                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                                                                    hintText:S.of(context).delivery,
                                                                    hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Quicksand')
                                                                )
                                                            ),
                                                          ],
                                                        ),
                                                        new ButtonTheme(
                                                          height: 50.0,
                                                          minWidth: MediaQuery.of(context).size.width,
                                                          child: RaisedButton.icon(
                                                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                                                            elevation: 0.0,
                                                            color: primaryColor,
                                                            icon: new Text(''),
                                                            label: new Text(
                                                              S.of(context).submit,
                                                              style: headingWhite,),
                                                            onPressed: (){

                                                              submit();
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                              ),
                                            ),
                                          )
                                      ),

                                    ],
                                  )
                              )
                          ),
                        ]
                        )
                      ]
                  ),
                )
            ),
          ),
      ),
    );
  }
}
