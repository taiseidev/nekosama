import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/features/post/presentation/components/post_item.dart';
import 'package:nekosama/src/utils/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // プラットフォーム（iOS / Android）に合わせてデモ用広告IDを返す
    String getTestAdBannerUnitId() {
      var testBannerUnitId = '';
      if (Platform.isAndroid) {
        // Android のとき
        testBannerUnitId =
            'ca-app-pub-3940256099942544/6300978111'; // Androidのデモ用バナー広告ID
      } else if (Platform.isIOS) {
        // iOSのとき
        testBannerUnitId =
            'ca-app-pub-3940256099942544/2934735716'; // iOSのデモ用バナー広告ID
      }
      return testBannerUnitId;
    }

    final myBanner = BannerAd(
      adUnitId: getTestAdBannerUnitId(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    )..load();

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: StackWithBackground(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: const CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1664984359266-c548a621db31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ],
                expandedHeight: 60,
                floating: true,
                backgroundColor: Colors.white,
                // pinned: true,
                elevation: 2,
                // flexibleSpace: const FlexibleSpaceBar(
                //   // title: /*省略*/,
                //   titlePadding: EdgeInsets.all(8),
                //   collapseMode: CollapseMode.pin,
                //   centerTitle: true,
                //   // background: /*省略*/,
                // ),
              ),
              SliverFixedExtentList(
                itemExtent: 1500,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        if (index % 5 == 0)
                          Container(
                            width: double.infinity,
                            height: 50,
                            color: Colors.white,
                            child: AdWidget(ad: myBanner),
                          ),
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: PostItem(
                            profileImageUrl:
                                'https://images.unsplash.com/photo-1664984359266-c548a621db31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                            userName: 'そらちゃんの日常🐱',
                            imageUrls:
                                'https://images.unsplash.com/photo-1574231164645-d6f0e8553590?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1008&q=80',
                            contents:
                                '今年はまだ夜が寒くニャイ？\n◉パブリマ出版Award2022 新人賞受賞！◉\n私のフォトブック“ねこ街(ねこまち)”が頂きました！\nただいま年末年始セール開催中です！\nねこ街販売サイトは、プロフィールのリンクをご覧下さい！\n🌿愛猫アカウント @sabi_neko_0301 もよろしくニャ\n演出はしない主義です。',
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// RefreshIndicator(
//             onRefresh: () async {
//               await Future<void>.delayed(const Duration(seconds: 2));
//             },
//             child: ListView.builder(
//               itemCount: 100,
//               itemBuilder: (context, index) {
//                 return const Padding(
//                   padding: EdgeInsets.all(16),
//                   child: PostItem(),
//                 );
//               },
//             ),
//           ),
