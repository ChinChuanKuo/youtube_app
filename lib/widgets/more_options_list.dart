import 'package:youtube_app/data/data.dart';
import 'package:youtube_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MoreOptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isTablet = Responsive.isTablet(context);
    return Container(
      constraints: BoxConstraints(maxWidth: isTablet ? 80.0 : 280.0),
      child: ListView.builder(
        itemCount: moreOption.length,
        itemBuilder: (BuildContext context, int index) {
          final List option = moreOption[index];
          switch (isTablet) {
            case true:
              switch (option[4]) {
                case true:
                  return _TabletOption(
                    icon: option[0],
                    color: option[1],
                    label: option[2],
                  );
              }
              return SizedBox.shrink();
          }
          switch (option[3]) {
            case true:
              return Divider(
                height: 30,
                thickness: 1,
              );
          }
          return _DesktopOption(
            icon: option[0],
            color: option[1],
            label: option[2],
          );
        },
      ),
    );
  }
}

class _TabletOption extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _TabletOption({
    Key key,
    @required this.icon,
    @required this.color,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      hoverColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25.0,
              color: color,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _DesktopOption extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _DesktopOption({
    Key key,
    @required this.icon,
    @required this.color,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      hoverColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            SizedBox(width: 22.0),
            Icon(
              icon,
              size: 25.0,
              color: color,
            ),
            SizedBox(width: 30.0),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
