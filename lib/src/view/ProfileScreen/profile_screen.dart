import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/view/ProfileEditScreen/profile_edit_screen.dart';
import 'package:flutter_app/src/view/SettingScreen/setting_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../login/login_screen.dart';

class ProfileScreen extends StatefulWidget {

  @override
  ProfileScreenState createState() => ProfileScreenState();
  }

class ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AccountProvider>(
        builder: (context, value, child) =>
         Column(
          children: <Widget>[
            SizedBox(height: 10.0 * 5),
            Column(
              children: <Widget>[
                Container(
                  height: 10.0 * 10,
                  width: 10.0 * 10,
                  margin: EdgeInsets.only(top: 10.0 * 3),
                  child: Stack(
                    children: <Widget>[
                      // CircleAvatar(
                      //   radius: 10.0 * 5,
                      //   backgroundImage: AssetImage('public/img/meo.jpg'),
                      // ),
                      CircleAvatar(
                        radius: 10.0 * 5,
                        backgroundImage: NetworkImage(value.accountSignedIn.gallery.images[0].imageUrl),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileEditScreen(),
                          ));
                        },
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 10.0 * 2.5,
                            width: 10.0 * 2.5,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              heightFactor: 10.0 * 1.5,
                              widthFactor: 10.0 * 1.5,
                              child: Icon(
                                FontAwesomeIcons.pencilAlt,
                                color: Colors.black,
                                size: 10.0 * 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0 * 2),
                Text(value.accountSignedIn.displayName,
                    style: TextStyle(
                      fontSize: 10.0 * 2,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(height: 3),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Icon(
                      FontAwesomeIcons.chessQueen,
                      color: Colors.yellowAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '531 Points | Sliver',
                      style: TextStyle(
                        fontSize: 10.0 * 1.3,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileEditScreen(),
                ));
              },
              child: Container(
                height: 10.0 * 5.5,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0 * 3,
                ).copyWith(
                  bottom: 10.0 * 2,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0 * 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 10.0 * 2.5,
                      color: Color(0xff28BEBA),
                    ),
                    SizedBox(width: 10.0 * 1.5),
                    Text('Tài khoản của tôi',
                        style: TextStyle(
                          fontSize: 10.0 * 1.7,
                          fontWeight: FontWeight.w500,
                        )),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      size: 10.0 * 2.5,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 10.0 * 5.5,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0 * 3,
                ).copyWith(
                  bottom: 10.0 * 2,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0 * 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.help, size: 10.0 * 2.5, color: Color(0xff28BEBA)),
                    SizedBox(width: 10.0 * 1.5),
                    Text('Trợ giúp và hỗ trợ',
                        style: TextStyle(
                          fontSize: 10.0 * 1.7,
                          fontWeight: FontWeight.w500,
                        )),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      size: 10.0 * 2.5,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 10.0 * 5.5,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0 * 3,
                ).copyWith(
                  bottom: 10.0 * 2,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0 * 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.policy,
                        size: 10.0 * 2.5, color: Color(0xff28BEBA)),
                    SizedBox(width: 10.0 * 1.5),
                    Text('Điều khoản & chính sách',
                        style: TextStyle(
                          fontSize: 10.0 * 1.7,
                          fontWeight: FontWeight.w500,
                        )),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      size: 10.0 * 2.5,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ));
              },
              child: Container(
                height: 10.0 * 5.5,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0 * 3,
                ).copyWith(
                  bottom: 10.0 * 2,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0 * 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.settings,
                        size: 10.0 * 2.5, color: Color(0xff28BEBA)),
                    SizedBox(width: 10.0 * 1.5),
                    Text('Cài đặt',
                        style: TextStyle(
                          fontSize: 10.0 * 1.7,
                          fontWeight: FontWeight.w500,
                        )),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      size: 10.0 * 2.5,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                gooleSignout();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
              child: Container(
                height: 10.0 * 5.5,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0 * 3,
                ).copyWith(
                  bottom: 10.0 * 2,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0 * 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.logout,
                        size: 10.0 * 2.5, color: Color(0xff28BEBA)),
                    SizedBox(width: 10.0 * 1.5),
                    Text('Đăng xuất',
                        style: TextStyle(
                          fontSize: 10.0 * 1.7,
                          fontWeight: FontWeight.w500,
                        )),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      size: 10.0 * 2.5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetUtils.appBottomNavigationBar(3),
    );
  }

  Future<void> gooleSignout() async {
    GoogleSignIn _googleSignIn = new GoogleSignIn();
    await FirebaseAuth.instance.signOut().then((onValue) {
      _googleSignIn.signOut();
    });
  }
}
