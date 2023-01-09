import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nekosama/src/features/post/presentation/components/post_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
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
        body: CustomScrollView(
          controller: controller,
          slivers: [
            SliverAppBar(
              leading: const Padding(
                padding: EdgeInsets.all(8),
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/08/31/09/01/woman-2699801_960_720.jpg',
                  ),
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  controller.animateTo(
                    0,
                    duration: const Duration(seconds: 2),
                    curve: Curves.ease,
                  );
                },
                child: const Text(
                  'nekosama',
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 20,
                  ),
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
              elevation: 2,
            ),
            SliverFixedExtentList(
              itemExtent: 600,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: const [
                      // if (index % 5 == 0 && index != 0)
                      //   Container(
                      //     width: double.infinity,
                      //     height: 600,
                      //     color: Colors.white,
                      //     child: AdWidget(ad: myBanner),
                      //   ),
                      PostItem(
                        profileImageUrl:
                            'https://images.unsplash.com/photo-1664984359266-c548a621db31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                        userName: 'そらちゃんの日常🐱',
                        imageUrls: [
                          'https://images.unsplash.com/photo-1516750484197-6b28d10c91ea?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MjN8fENhdHN8ZW58MHx8fHwxNjczMTgyNTYz&ixlib=rb-4.0.3&q=80&w=400',
                          'https://images.unsplash.com/photo-1516280030429-27679b3dc9cf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NHx8Q2F0c3xlbnwwfHx8fDE2NzMxODI1NjM&ixlib=rb-4.0.3&q=80&w=400',
                          'https://images.unsplash.com/photo-1532386236358-a33d8a9434e3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fENhdHN8ZW58MHx8fHwxNjczMTgyNTYz&ixlib=rb-4.0.3&q=80&w=400',
                          'https://images.unsplash.com/photo-1574231164645-d6f0e8553590?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1008&q=80'
                        ],
                        contents:
                            '今年はまだ夜が寒くニャイ？\n◉パブリマ出版Award2022 新人賞受賞！◉\n私のフォトブック“ねこ街(ねこまち)”が頂きました！\nただいま年末年始セール開催中です！\nねこ街販売サイトは、プロフィールのリンクをご覧下さい！\n🌿愛猫アカウント @sabi_neko_0301 もよろしくニャ\n演出はしない主義です。',
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
    );
  }
}
