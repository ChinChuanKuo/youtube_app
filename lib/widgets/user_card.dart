import 'package:flutter/material.dart';
import 'package:youtube_app/models/models.dart';
import 'package:youtube_app/widgets/widgets.dart';

class UserCard extends StatelessWidget {
  final User user;
  final bool showName;

  const UserCard({
    Key key,
    @required this.user,
    this.showName = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      child: showName
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileAvatar(
                  imageUrl: user.imageUrl,
                  radius: 20.0,
                ),
                SizedBox(width: 12.0),
                Flexible(
                  child: Text(
                    user.name,
                    style: TextStyle(fontSize: 16.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          : ProfileAvatar(
              imageUrl: user.imageUrl,
              radius: 20.0,
            ),
    );
  }
}
