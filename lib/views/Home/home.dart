import 'package:flutter/material.dart';
import 'package:youtube_app/config/palette.dart';
import 'package:youtube_app/data/data.dart';
import 'package:youtube_app/widgets/widgets.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    Palette.textEditingController.dispose();
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileHomeView(
        scrollController: _trackingScrollController,
      ),
      tablet: DesktopHomeView(
        scrollController: _trackingScrollController,
      ),
      desktop: DesktopHomeView(
        scrollController: _trackingScrollController,
      ),
    );
  }
}

class MobileHomeView extends StatelessWidget {
  final TrackingScrollController scrollController;

  const MobileHomeView({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        MobileAppBar(
          textEditingController: Palette.textEditingController,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 15.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = videos[index];
                return VideoCard(video: video);
              },
              childCount: videos.length,
            ),
          ),
        )
      ],
    );
  }
}

class DesktopHomeView extends StatelessWidget {
  final TrackingScrollController scrollController;

  const DesktopHomeView({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 12.0,
                top: 12.0,
                bottom: 12.0,
              ),
              child: MoreOptionsList(),
            ),
          ),
        ),
        Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [],
          ),
        ),
      ],
    );
  }
}
