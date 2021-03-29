import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_app/data/data.dart';
import 'package:youtube_app/views/views.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_app/widgets/widgets.dart';

class VideoView extends StatefulWidget {
  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read(miniPlayerControllerProvider)
          .state
          .animateToHeight(state: PanelState.MAX),
      child: Scaffold(
        body: Container(
          child: CustomScrollView(
            controller: _scrollController,
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Consumer(
                  builder: (context, watch, _) {
                    final selectedVideo = watch(selectedVideoProvider).state;
                    return SafeArea(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                selectedVideo.thumbnailUrl,
                                height: 220.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              CircleButton(
                                icon: Icons.keyboard_arrow_down,
                                iconSize: 25.0,
                                onPressed: () {
                                  context
                                      .read(miniPlayerControllerProvider)
                                      .state
                                      .animateToHeight(state: PanelState.MIN);
                                },
                              )
                            ],
                          ),
                          const LinearProgressIndicator(
                            value: 0.4,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.red,
                            ),
                          ),
                          VideoInfo(video: selectedVideo),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final video = suggestedVideos[index];
                    return VideoCard(
                      video: video,
                      hasPadding: true,
                      onTap: () => _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      ),
                    );
                  },
                  childCount: suggestedVideos.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
