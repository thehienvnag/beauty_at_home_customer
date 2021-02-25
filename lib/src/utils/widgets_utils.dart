import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/app_bottom_navigation_bar.dart';
import 'package:flutter_app/src/widgets/shared_widget/search_text_field.dart';

class WidgetUtils {
  static Widget appBottomNavigationBar(int activeTab) => AppBottomNavigationBar(
        currentActiveIndex: activeTab,
      );
  static final Widget searchTextField = SearchTextField();
}
