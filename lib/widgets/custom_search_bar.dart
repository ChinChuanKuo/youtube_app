import 'package:flutter/material.dart';
import 'package:youtube_app/widgets/widgets.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController textEditingController;

  const CustomSearchBar({
    Key key,
    @required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: const EdgeInsets.only(left: 20.0, right: 12.0),
              hintText: 'Search',
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 25.0,
                  color: Colors.black,
                ),
                onPressed: () => print("Search"),
              ),
            ),
          ),
        ),
        CircleButton(
          icon: Icons.mic,
          iconSize: 25.0,
          onPressed: () => print("Mic"),
        ),
      ],
    );
  }
}
