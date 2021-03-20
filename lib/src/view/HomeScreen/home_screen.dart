import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/view/LocationChangeDescription/location_change_description_screen.dart';
import 'package:flutter_app/src/view/ProfileScreen/profile_screen.dart';
import 'package:flutter_app/src/widgets/home_screen_widget.dart';
import 'package:flutter_app/src/widgets/search_screen_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget/search_text_field.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isScrollTop = false;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    var providerDetail = context.read<ProviderDetailProvider>();
    providerDetail.initProvider();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0.7,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: [
            Container(
              width: screenSize.width * 0.95,
              padding: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LocationChangeDescriptionScreen(),
                        ),
                      );
                    },
                    child: HomeAppBarTitle(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                    },
                    child: Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('public/img/images.png'),
                        radius: 17,
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              SearchTextField(
                isReadonly: true,
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Container(
              //     padding: EdgeInsets.only(top: 15, left: 10),
              //     child: Text(
              //       'ƯU ĐÃI',
                    // style: CustomTextStyle.headline600Text(
                    //   Colors.orange,
                    // ),
              //     ),
              //   ),
              // ),
              SlideService(),
              // ViewsPromotion(),
              ServiceWidget(),

              BeauticianWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: WidgetUtils.appBottomNavigationBar(0),
    );
  }
}
