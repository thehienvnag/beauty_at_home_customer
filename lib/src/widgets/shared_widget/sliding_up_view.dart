import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingUpView extends StatefulWidget {
  final Widget body;
  final List<Widget> panelContents;
  final double minHeight, maxHeight;
  final bool isDraggable;
  const SlidingUpView({
    Key key,
    this.body,
    this.panelContents,
    this.maxHeight,
    this.minHeight,
    this.isDraggable,
  }) : super(key: key);

  @override
  _SlidingUpViewState createState() => _SlidingUpViewState(
        body: body,
        panelContents: panelContents,
        minHeight: minHeight,
        maxHeight: maxHeight,
        isDraggable: isDraggable,
      );
}

class _SlidingUpViewState extends State<SlidingUpView> {
  bool isClosed = true;
  final bool isDraggable;
  final PanelController panelController = PanelController();
  final Widget body;
  final List<Widget> panelContents;
  final double minHeight, maxHeight;

  _SlidingUpViewState({
    this.body,
    this.panelContents,
    this.minHeight,
    this.maxHeight,
    this.isDraggable = true,
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            controller: panelController,
            minHeight: this.minHeight,
            maxHeight: this.maxHeight,
            parallaxEnabled: true,
            parallaxOffset: .02,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            color: Colors.transparent,
            boxShadow: null,
            isDraggable: this.isDraggable,
          ),
          // the fab
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (!isDraggable) return;
            if (isClosed)
              panelController.open();
            else
              panelController.close();
            setState(() {
              this.isClosed = !this.isClosed;
            });
          },
          child: SlidingPanel(
            scrollController: sc,
            children: panelContents,
          )),
    );
  }

  Widget _body() {
    return body;
  }
}

class SlidingPanel extends StatelessWidget {
  final List<Widget> children;
  final ScrollController scrollController;
  const SlidingPanel({
    Key key,
    this.children,
    this.scrollController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: children,
    );
  }
}
