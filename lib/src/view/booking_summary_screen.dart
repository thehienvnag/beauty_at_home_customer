import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/outlined_card_expandable.dart';

class BookingSummaryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return OutlinedCardExpandable();
  }
}
