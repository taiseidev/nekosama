import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/gen/assets.gen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostItem extends ConsumerStatefulWidget {
  const PostItem({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    required this.imageUrls,
    required this.contents,
  });

  final String profileImageUrl;
  final String userName;
  final List<String> imageUrls;
  final String contents;

  @override
  PostItemState createState() => PostItemState();
}

class PostItemState extends ConsumerState<PostItem>
    with SingleTickerProviderStateMixin {
  // お気に入りのアニメーションを管理するコントローラー
  late AnimationController _favoriteController;
  // コントローラーで生成した値を使って色やサイズなどの値を作ってくれるクラス（Tween）
  late Animation<dynamic> _favoriteColorAnimation;

  bool isFavorite = false;
  double currentPosition = 0;

  final _controller = PageController();

  @override
  void initState() {
    super.initState();

    _favoriteController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _favoriteColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.red[400],
    ).animate(_favoriteController);
  }

  // タグに変更する処理
  List<Widget> distinctUrlMessage(String message) {
    final tagRegExp = RegExp(r'#([^\s]+)\s');

    final tagMatches = tagRegExp.allMatches(message);

    final messages = <String>[];
    final contents = <Widget>[];
    var textEnd = '';
    var count = 0;

    // タグの数だけループ
    for (final tagMatch in tagMatches) {
      final tag = message.substring(tagMatch.start, tagMatch.end);

      List<String> text;

      if (count == 0) {
        text = message.split(tag);
      } else {
        text = textEnd.split(tag);
      }

      count++;

      if (text[0] != tag) {
        messages.add(text[0]);
      }

      messages.add(tag);
      textEnd = text.last;
    }

    if (textEnd != '') {
      messages.add(textEnd);
    }

    for (final list in messages) {
      if (tagRegExp.hasMatch(list)) {
        contents.add(
          InkWell(
            onTap: () async {
              await Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TagPage(tag: list);
                  },
                ),
              );
            },
            child: Text(
              list,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        );
      } else {
        contents.add(
          Flexible(
            child: Text(
              list,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      }
    }

    return contents;
  }

  Future<void> runFavoriteAnimation() async {
    await _favoriteController.forward();
    await Future<void>.delayed(const Duration(seconds: 1));
    await _favoriteController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.profileImageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(child: Text(widget.userName)),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: GestureDetector(
              onDoubleTap: () async {
                setState(() {
                  isFavorite = true;
                });
                await runFavoriteAnimation();
              },
              child: PageView.builder(
                controller: _controller,
                itemCount: widget.imageUrls.length,
                itemBuilder: (context, index) {
                  final image = widget.imageUrls[index];
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 400,
                        height: 300,
                        child: CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: AnimatedBuilder(
                          animation: _favoriteController,
                          builder: (context, child) {
                            return IconButton(
                              color: _favoriteColorAnimation.value as Color,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                size: 100,
                              ),
                            );
                          },
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8),
                      //   child: Align(
                      //     alignment: Alignment.topRight,
                      //     child: Opacity(
                      //       opacity: 0.6,
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //           color: Colors.grey,
                      //           borderRadius: BorderRadius.circular(20),
                      //         ),
                      //         padding: const EdgeInsets.symmetric(
                      //           vertical: 8,
                      //           horizontal: 16,
                      //         ),
                      //         child: const Text(
                      //           'そらちゃんfdfdfdfdfdfd',
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.post.comment,
                      width: 26,
                    ),
                    iconSize: 26,
                  ),
                  // const Text('12件'),
                ],
              ),
              IconButton(
                onPressed: () async {
                  await HapticFeedback.heavyImpact();
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  if (isFavorite) {
                    await runFavoriteAnimation();
                  }
                },
                icon: isFavorite
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red[300],
                      )
                    : const Icon(Icons.favorite_border_outlined),
                iconSize: 26,
              ),
              const Spacer(),
              SmoothPageIndicator(
                controller: _controller, // PageController
                count: widget.imageUrls.length,
                effect: const ScrollingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                ),
              ),
              const Spacer(flex: 2),
              IconButton(
                onPressed: () async {
                  await showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled:
                        true, //trueにしないと、Containerのheightが反映されない
                    useRootNavigator: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 500,
                        child: Column(
                          children: [
                            const Gap(16),
                            Container(
                              width: 30,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.more_horiz),
                iconSize: 26,
              ),
            ],
          ),
          Wrap(
            children: [
              for (final text in distinctUrlMessage(widget.contents)) text
            ],
          ),
          // Text(widget.contents)
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _favoriteController.dispose();
  }
}

class TagPage extends StatelessWidget {
  const TagPage({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tag),
      ),
      body: Center(
        child: Text('$tag画面に遷移しました'),
      ),
    );
  }
}
