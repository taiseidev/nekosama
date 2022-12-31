import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/utils/constants/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:video_player/video_player.dart';

enum TabType {
  home('/home'),
  search('/search'),
  post('/post'),
  community('/community'),
  profile('/profile');

  const TabType(this.path);
  final String path;
}

class ScaffoldWithBottomNavBar extends HookConsumerWidget {
  const ScaffoldWithBottomNavBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    void transitionToSelectedTabLocation(int index) {
      if (index != currentIndex.value) {
        final tab = TabType.values[index];
        // タブの表示を変更
        currentIndex.value = index;
        // 選択したタブの画面へ遷移
        context.go(tab.path);
      } else if (GoRouter.of(context).canPop()) {
        debugPrint('詳細画面');
        context.pop();
      }
    }

    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SalomonBottomBar(
          unselectedItemColor: Colors.white,
          currentIndex: currentIndex.value,
          onTap: transitionToSelectedTabLocation,
          items: ref.watch(tabsProvider),
        ),
      ),
    );
  }
}

final tabsProvider = Provider<List<SalomonBottomBarItem>>(
  (_) => [
    /// Home
    SalomonBottomBarItem(
      icon: const Icon(Icons.home),
      title: const Text('ホーム'),
      selectedColor: Colors.purple,
    ),

    /// Search
    SalomonBottomBarItem(
      icon: const Icon(Icons.search),
      title: const Text('検索'),
      selectedColor: Colors.orange,
    ),

    /// Likes
    SalomonBottomBarItem(
      icon: const Icon(Icons.add),
      title: const Text('投稿'),
      selectedColor: Colors.blue,
    ),

    /// Likes
    SalomonBottomBarItem(
      icon: const Icon(Icons.group),
      title: const Text('コミュニティ'),
      selectedColor: Colors.pink,
    ),

    /// Profile
    SalomonBottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text('プロフィール'),
      selectedColor: Colors.teal,
    ),
  ],
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: StackWithBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('ホーム画面'),
                ElevatedButton(
                  onPressed: () {
                    context.go('/home/detail');
                  },
                  child: const Text('詳細画面へ遷移'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final VideoPlayerController videoPlayerController;
  late final Widget playerWidget;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    Future(() async {
      await videoPlayerController.initialize();
    });
    final chewieController = ChewieController(
      aspectRatio: 2 / 3,
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: StackWithBackground(
          child: playerWidget,
        ),
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: StackWithBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('投稿画面'),
                ElevatedButton(
                  onPressed: () {
                    context.go('/home/detail');
                  },
                  child: const Text('詳細画面へ遷移'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: StackWithBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('コミュニティ画面'),
                ElevatedButton(
                  onPressed: () {
                    context.go('/home/detail');
                  },
                  child: const Text('詳細画面へ遷移'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: StackWithBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('プロフィール画面'),
                ElevatedButton(
                  onPressed: () {
                    context.go('/home/detail');
                  },
                  child: const Text('詳細画面へ遷移'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: StackWithBackground(
        child: Center(
          child: Text('テスト'),
        ),
      ),
    );
  }
}
