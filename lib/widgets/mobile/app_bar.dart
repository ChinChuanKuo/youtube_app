import 'package:flutter/material.dart';
import 'package:youtube_app/config/palette.dart';
import 'package:youtube_app/data/data.dart';
import 'package:youtube_app/widgets/widgets.dart';

class MobileAppBar extends StatefulWidget {
  final String title;
  final TextEditingController textEditingController;

  const MobileAppBar({
    Key key,
    @required this.title,
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
    return Container(
      padding: isSearch
          ? const EdgeInsets.symmetric(horizontal: 5.0)
          : const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: isSearch
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButton(
                  icon: Icons.arrow_back,
                  iconSize: 25.0,
                  onPressed: () => setState(() => isSearch = !isSearch),
                ),
                Expanded(
                  child: CustomSearchBar(
                    textEditingController: this.widget.textEditingController,
                  ),
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    this.widget.title,
                    style: TextStyle(
                      color: Palette.facebookBlue,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleButton(
                      icon: Icons.mic,
                      iconSize: 25.0,
                      onPressed: () => print("Mic"),
                    ),
                    CircleButton(
                      icon: Icons.search,
                      iconSize: 25.0,
                      onPressed: () => setState(() => isSearch = !isSearch),
                    ),
                    CircleButton(
                      icon: Icons.video_call,
                      iconSize: 25.0,
                      onPressed: () => print("Video Call"),
                    ),
                    CircleButton(
                      icon: Icons.notifications,
                      iconSize: 25.0,
                      onPressed: () => print("Notification"),
                    ),
                    SizedBox(width: 15.0),
                    UserCard(user: currentUser),
                    SizedBox(width: 12.0),
                  ],
                ),
              ],
            ),
    );
  }
}
