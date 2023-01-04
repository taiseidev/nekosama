import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/gen/assets.gen.dart';

final isFavoriteProvider = StateProvider<bool>((_) => false);

class PostItem extends ConsumerStatefulWidget {
  const PostItem({super.key});

  @override
  PostItemState createState() => PostItemState();
}

class PostItemState extends ConsumerState<PostItem>
    with SingleTickerProviderStateMixin {
  // お気に入りのアニメーションを管理するコントローラー
  late AnimationController _favoriteController;
  // コントローラーで生成した値を使って色やサイズなどの値を作ってくれるクラス（Tween）
  late Animation _favoriteColorAnimation;

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
  void dispose() {
    super.dispose();
    _favoriteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 1000, // 最初は700で設定する
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1664984359266-c548a621db31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                ),
              ),
              SizedBox(width: 8),
              Text('そらちゃんの日常🐱'),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://images.unsplash.com/photo-1574231164645-d6f0e8553590?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1008&q=80',
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
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      debugPrint('コメントがタップされました');
                    },
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
                  ref
                      .read(isFavoriteProvider.notifier)
                      .update((state) => state = !state);
                  if (ref.watch(isFavoriteProvider)) {
                    await _favoriteController.forward();
                    await Future<void>.delayed(const Duration(seconds: 1));
                    await _favoriteController.reverse();
                  }
                },
                icon: ref.watch(isFavoriteProvider)
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red[300],
                      )
                    : const Icon(Icons.favorite_border_outlined),
                iconSize: 26,
              ),
              const Spacer(),
              const Icon(
                Icons.circle,
                color: Colors.blue,
                size: 12,
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.circle,
                color: Colors.grey,
                size: 12,
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.circle,
                color: Colors.grey,
                size: 12,
              ),
              const Spacer(
                flex: 2,
              ),
              IconButton(
                onPressed: () {
                  debugPrint('ドットメニューがタップされました');
                },
                icon: const Icon(Icons.more_horiz),
                iconSize: 26,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '今年はまだ夜が寒くニャイ？\n◉パブリマ出版Award2022 新人賞受賞！◉\n私のフォトブック“ねこ街(ねこまち)”が頂きました！\nただいま年末年始セール開催中です！\nねこ街販売サイトは、プロフィールのリンクをご覧下さい！\n🌿愛猫アカウント @sabi_neko_0301 もよろしくニャ\n演出はしない主義です。',
          )
        ],
      ),
    );
  }
}
