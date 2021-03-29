import 'package:flutter/material.dart';
import 'package:youtube_app/config/palette.dart';
import 'package:youtube_app/data/data.dart';
import 'package:youtube_app/widgets/widgets.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(
                  icon: Icons.menu,
                  iconSize: 25.0,
                  iconColor: Palette.defaultIconColor,
                  onPressed: () => print("menu"),
                ),
                SizedBox(width: 18.0),
                Expanded(
                  child: Text(
                    Palette.title,
                    style: TextStyle(
                      color: Palette.facebookBlue,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.40,
            child: CustomSearchBar(
              textEditingController: Palette.textEditingController,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleButton(
                  icon: Icons.video_call,
                  iconSize: 25.0,
                  iconColor: Palette.defaultIconColor,
                  onPressed: () => print("Video Call"),
                ),
                CircleButton(
                  icon: Icons.apps,
                  iconSize: 25.0,
                  iconColor: Palette.defaultIconColor,
                  onPressed: () => print("Apps"),
                ),
                CircleButton(
                  icon: Icons.notifications,
                  iconSize: 25.0,
                  iconColor: Palette.defaultIconColor,
                  onPressed: () => print("Notification"),
                ),
                SizedBox(width: 15.0),
                UserCard(user: currentUser),
                SizedBox(width: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
