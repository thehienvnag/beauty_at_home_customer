import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/widgets/shared_widget/outlined_card.dart';

class OutlinedCardExpandable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OutlinedCardExpandableState();
}

class OutlinedCardExpandableState extends State<OutlinedCardExpandable> {
  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      shapeBorder: ContinuousRectangleBorder(
        side: BorderSide.none,
      ),
      sections: [],
    );
  }
}
