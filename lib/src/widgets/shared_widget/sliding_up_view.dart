import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingUpView extends StatefulWidget {
  final bool isDraggable;
  final Widget body;
  final List<Widget> panelContents;
  final double minHeight, maxHeight;

  SlidingUpView({
    this.body,
    this.panelContents,
    this.minHeight,
    this.maxHeight,
    this.isDraggable = true,
  });

  @override
  _SlidingUpViewState createState() => _SlidingUpViewState();
}

class _SlidingUpViewState extends State<SlidingUpView> {
  bool isClosed = true;

  final PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            controller: panelController,
            minHeight: this.widget.minHeight,
            maxHeight: this.widget.maxHeight,
            parallaxEnabled: true,
            parallaxOffset: .02,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            color: Colors.transparent,
            boxShadow: null,
            isDraggable: this.widget.isDraggable,
          ),
          // the fab
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (!widget.isDraggable) return;
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
        children: widget.panelContents,
      ),
    );
  }

  Widget _body() {
    return widget.body;
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
