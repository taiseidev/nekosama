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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(),
          bottom: BorderSide(),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
                const SizedBox(width: 8),
                Flexible(child: Text(widget.userName)),
              ],
            ),
          ),
          SizedBox(
            height: 300,
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
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
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
          const SizedBox(height: 16),
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
                    await _favoriteController.forward();
                    await Future<void>.delayed(const Duration(seconds: 1));
                    await _favoriteController.reverse();
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
          const SizedBox(height: 16),
          Text(widget.contents)
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
