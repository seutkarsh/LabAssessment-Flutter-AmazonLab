import 'package:amazon_lab/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  var images4 = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
  ];
  int selected_index = 10;
  bool vis = false;

  var textlist = ["Snow Day", "Rainy Day", "Storm", "Sunny Day"];

  @override
  void initState() {
    // TODO: implement initState

    _controller = VideoPlayerController.asset('assets/images/video2.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab Assignment"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 300,
                child: Swiper(
                  autoplay: false,
                  autoplayDelay: 1500,
                  curve: Curves.easeIn,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        selected_index = index;
                        setState(() {
                          if (vis == true) {
                            vis = false;
                          } else {
                            vis = true;
                          }
                        });
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage(images4[index]),
                            fit: BoxFit.cover,
                          )),
                    );
                  },
                  viewportFraction: 0.8,
                  scale: 0.9,
                  pagination: SwiperPagination(),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              vis
                  ? Text(
                      textlist[selected_index],
                      style: TextStyle(fontSize: 20),
                    )
                  : Text(""),
              SizedBox(
                height: 20,
              ),
              vis
                  ? Container(
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
                    )
                  : Container()
            ],
          ),
        ),
      ),
      bottomSheet: Footer(),
    );
  }
}
