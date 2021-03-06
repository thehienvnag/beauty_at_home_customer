import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/app_bottom_navigation_bar.dart';
import 'package:flutter_app/src/widgets/shared_widget/search_text_field.dart';

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
}
