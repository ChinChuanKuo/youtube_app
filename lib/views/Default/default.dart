import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_app/config/palette.dart';
import 'package:youtube_app/data/data.dart';
import 'package:youtube_app/models/models.dart';
import 'package:youtube_app/views/views.dart';
import 'package:youtube_app/widgets/widgets.dart';
import 'package:miniplayer/miniplayer.dart';

final selectedVideoProvider = StateProvider<Video>((ref) => null);

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class DefaultView extends StatefulWidget {
  const DefaultView({
    Key key,
  }) : super(key: key);
  @override
  _DefaultViewState createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {
  int _selectedIndex;
  double _playerMinHeight;

  @override
  void initState() {
    _selectedIndex = 0;
    _playerMinHeight = 60.0;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Palette.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: isMobile
          ? null
          : PreferredSize(
              preferredSize: Size(screenSize.width, 100.0),
              child: DesktopAppBar(),
            ),
      body: Consumer(
        builder: (context, watch, _) {
          final selectedVideo = watch(selectedVideoProvider).state;
          final selectedIsNull = selectedVideo == null;
          final miniPlayerController =
              watch(miniPlayerControllerProvider).state;
          return Stack(
            children: views
                .asMap()
                .map(
                  (i, view) => MapEntry(
                    i,
                    Offstage(
                      offstage: _selectedIndex != i,
                      child: view,
                    ),
                  ),
                )
                .values
                .toList()
                  ..add(
                    Offstage(
                      offstage: selectedIsNull,
                      child: Miniplayer(
                        controller: miniPlayerController,
                        minHeight: _playerMinHeight,
                        maxHeight: screenSize.height,
                        builder: (height, percentage) {
                          if (selectedIsNull) {
                            return const SizedBox.shrink();
                          }
                          if (height <= _playerMinHeight + 50.0) {
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        selectedVideo.thumbnailUrl,
                                        height: _playerMinHeight - 4.0,
                                        width: 120.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  selectedVideo.title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  selectedVideo.author.username,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      CircleButton(
                                        icon: Icons.play_arrow,
                                        iconSize: 25.0,
                                        onPressed: () {},
                                      ),
                                      CircleButton(
                                        icon: Icons.close,
                                        iconSize: 25.0,
                                        onPressed: () => context
                                            .read(selectedVideoProvider)
                                            .state = null,
                                      ),
                                    ],
                                  ),
                                  const LinearProgressIndicator(
                                    value: 0.4,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return VideoView();
                        },
                      ),
                    ),
                  ),
          );
        },
      ),
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: (i) => setState(() => _selectedIndex = i),
              selectedFontSize: 10.0,
              unselectedFontSize: 10.0,
              selectedItemColor: Palette.selectedIconColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  activeIcon: Icon(Icons.explore),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline),
                  activeIcon: Icon(Icons.add_circle),
                  label: 'Add',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.subscriptions_outlined),
                  activeIcon: Icon(Icons.subscriptions),
                  label: 'Subscriptions',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library_outlined),
                  activeIcon: Icon(Icons.video_library),
                  label: 'Library',
                ),
              ],
            )
          : SizedBox.shrink(),
    );
  }
}
