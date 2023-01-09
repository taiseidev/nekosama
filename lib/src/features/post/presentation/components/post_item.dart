import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
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

  // URLを判別する処理
  List<Widget> distinctUrlMessage(String message) {
    final urlRegExp = RegExp(
      r'((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,1024}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?',
    );

    final tagRegExp = RegExp(r'#.+ ');

    final urlMatches = urlRegExp.allMatches(message);
    final tagMatches = tagRegExp.allMatches(message);

    final messages = <String>[];
    final contents = <Widget>[];
    var textEnd = '';
    var count = 0;

    // URLの数だけループ
    for (final urlMatch in tagMatches) {
      final url = message.substring(urlMatch.start, urlMatch.end);
      print(url);
      List<String> text;

      if (count == 0) {
        text = message.split(url);
      } else {
        text = textEnd.split(url);
      }

      count++;

      if (text[0] != url) {
        messages.add(text[0]);
      }

      messages.add(url);
      textEnd = text.last;
    }

    if (textEnd != '') {
      messages.add(textEnd);
    }

    // print(messages);

    // タグの場合はリンクに変換
    for (final list in messages) {
      if (tagRegExp.hasMatch(list)) {
        contents.add(
          InkWell(
            onTap: () {
              print('リンクがタップされました');
            },
            child: Text(
              list,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        );
      } else {
        contents.add(
          Text(
            list,
            style: const TextStyle(color: Colors.black),
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
                CircleAvatar(
                  radius: 15,
                  child: CachedNetworkImage(
                    imageUrl: widget.profileImageUrl,
                    fit: BoxFit.cover,
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
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                iconSize: 26,
              ),
            ],
          ),
          Wrap(
            children: [
              for (final item in distinctUrlMessage(widget.contents)) item
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
