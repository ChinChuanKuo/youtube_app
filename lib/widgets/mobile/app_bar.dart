import 'package:flutter/material.dart';
import 'package:youtube_app/config/palette.dart';
import 'package:youtube_app/data/data.dart';
import 'package:youtube_app/widgets/widgets.dart';

class MobileAppBar extends StatefulWidget {
  final TextEditingController textEditingController;

  const MobileAppBar({
    Key key,
    @required this.textEditingController,
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
      backgroundColor: Colors.white,
      title: Text(
        Palette.title,
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 28.0,
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
          iconSize: 35.0,
          hoverColor: Colors.transparent,
          icon: CircleAvatar(
            foregroundImage: NetworkImage(currentUser.profileImageUrl),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
