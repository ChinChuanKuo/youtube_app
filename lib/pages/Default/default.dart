import 'package:flutter/material.dart';
import 'package:youtube_app/data/data.dart';
import 'package:youtube_app/widgets/widgets.dart';

class DefaultScreen extends StatefulWidget {
  final String title;

  const DefaultScreen({
    Key key,
    @required this.title,
  }) : super(key: key);
  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  int _selectedIndex;
  final TextEditingController _textEditingController =
      new TextEditingController();

  @override
  void initState() {
    _selectedIndex = 0;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: icons.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(screenSize.width, 100.0),
            child: isMobile
                ? MobileAppBar(
                    title: this.widget.title,
                    textEditingController: _textEditingController,
                  )
                : DesktopAppBar(
                    title: this.widget.title,
                    textEditingController: _textEditingController,
                  ),
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: screens,
          ),
          bottomNavigationBar: isMobile
              ? Container(
                  child: CustomTabBar(
                    icons: icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) => setState(() => _selectedIndex = index),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
