import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/app_bottom_navigation_bar.dart';
import 'package:flutter_app/src/widgets/shared_widget/search_text_field.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

final _appBottomNavigationBar = (currentActiveIndex) => AppBottomNavigationBar(
      currentActiveIndex: currentActiveIndex,
    );
final _searchTextField = (isReadonly, keySearch) => SearchTextField(
      isReadonly: isReadonly,
      initialValue: keySearch,
    );

class WidgetUtils {
  static Widget appBottomNavigationBar(int currentActiveIndex) =>
      _appBottomNavigationBar(currentActiveIndex);
  static Widget searchTextField(bool isReadonly, {String keySearch}) =>
      _searchTextField(isReadonly, keySearch);
  static void showSnackBar(
    BuildContext context, {
    Widget content,
    String actionLabel,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: content,
      action: SnackBarAction(
        label: actionLabel,
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showDialogStatic(BuildContext context, {String title}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        // title: Text("Bạn có chắc muốn hủy đơn?"),
        content: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 200,
              child: Text(title,
                  style: CustomTextStyle.statusText(Colors.black54)),
            ),
          ],
        ),
      ),
    );
  }
}
