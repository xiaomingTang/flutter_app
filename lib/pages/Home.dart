import 'package:flutter/material.dart';
import 'package:flutter_app/common/homeModel.dart';

import 'package:flutter_app/common/network.dart';
import 'package:flutter_app/components/Link.dart';
import 'package:flutter_app/components/WebTreeComp.dart';
import 'package:flutter_app/models/index.dart' as Models;
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Models.WebTree _webTree = defaultWebTree;
  SwiperControl _swiperControl = SwiperControl();
  SwiperPagination _swiperPagination = SwiperPagination();

  @override
  void initState() {
    super.initState();
    Network(context).getWebTree().then((res) {
      if (res != null) {
        setState(() {
          _webTree = res;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            child: Consumer<HomeModel>(
              builder: (context, homeModel, child) => Swiper(
                // 不加 key 会导致轮播数量变化时出现异常(error)
                key: UniqueKey(),
                itemBuilder: (BuildContext context, int index) {
                  Models.Banner banner = homeModel.banners[index];
                  String link = WebRootUri.resolve(banner.link).toString();
                  String imgPath =
                      WebRootUri.resolve(banner.picture).toString();
                  return Link(
                    href: link,
                    child: Image.network(
                      imgPath,
                      fit: BoxFit.cover,
                    ),
                    openInWebview: true,
                    title: banner.name ?? "unknown",
                  );
                },
                itemCount: homeModel.banners.length,
                pagination: _swiperPagination,
                control: _swiperControl,
              ),
            ),
          ),
          WebTreeComp(webTree: _webTree),
        ],
      ),
    );
  }
}
