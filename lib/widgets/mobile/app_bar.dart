import 'package:flutter/material.dart';
import 'package:youtube_app/config/palette.dart';
import 'package:youtube_app/data/data.dart';
import 'package:youtube_app/widgets/widgets.dart';

class MobileAppBar extends StatefulWidget {
  const MobileAppBar({
    Key key,
  }) : super(key: key);

  @override
  _MobileAppBarState createState() => _MobileAppBarState();
}

class _MobileAppBarState extends State<MobileAppBar> {
  bool isSearch;

  @override
  void initState() {
    isSearch = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 65.0,
      backgroundColor: Colors.white,
      title: Text(
        Palette.title,
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
      ),
      centerTitle: false,
      floating: true,
      actions: [
        CircleButton(
          icon: Icons.cast,
          iconSize: 25.0,
          iconColor: Palette.defaultIconColor,
          onPressed: () => print("Cast"),
        ),
        CircleButton(
          icon: Icons.notifications_outlined,
          iconSize: 25.0,
          iconColor: Palette.defaultIconColor,
          onPressed: () => print("Notification"),
        ),
        CircleButton(
          icon: Icons.search,
          iconSize: 25.0,
          iconColor: Palette.defaultIconColor,
          onPressed: () => setState(() => isSearch = !isSearch),
        ),
        IconButton(
          iconSize: 40.0,
          hoverColor: Colors.transparent,
          icon: CircleAvatar(
            foregroundImage: NetworkImage(currentUser.profileImageUrl),
          ),
          onPressed: () {},
        ),
        SizedBox(width: 12.0),
      ],
    );
  }
}
