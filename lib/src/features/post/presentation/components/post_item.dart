import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/gen/assets.gen.dart';

class PostItem extends HookConsumerWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 「続きを読むを」押下したら投稿欄を広げる
    final isExpanded = useState(false);
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
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              'https://images.unsplash.com/photo-1574231164645-d6f0e8553590?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1008&q=80',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
              IconButton(
                onPressed: () {
                  debugPrint('お気に入りがタップされました');
                },
                icon: const Icon(Icons.favorite_border_outlined),
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
                flex: 3,
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
