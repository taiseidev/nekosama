import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
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
      }
      // 同一のタブをタップしたらpopする
      if (index == currentIndex.value && GoRouter.of(context).canPop()) {
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

final cameraProvider = FutureProvider<Widget>((ref) async {
  final storageRef =
      FirebaseStorage.instance.ref().child('users/sora/video.png');

  final video = await storageRef.getDownloadURL();

  final videoPlayerController = VideoPlayerController.network(video);
  await videoPlayerController.initialize();

  final chewieController = ChewieController(
    videoPlayerController: videoPlayerController,
    autoPlay: true,
    looping: true,
  );

  return Chewie(
    controller: chewieController,
  );
});

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plyerWidget = ref.watch(cameraProvider);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: scaffoldBackgroundColor,
        body: StackWithBackground(
          child: plyerWidget.when(
            data: (data) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Expanded(child: data),
                  ),
                ],
              );
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            },
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class PostPage extends HookConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          final video =
              await ImagePicker().pickVideo(source: ImageSource.gallery);
          final file = File(video!.path);
          final storageRef =
              FirebaseStorage.instance.ref().child('users/sora/video.png');

          await storageRef.putFile(file);
        });
        return null;
      },
      const [],
    );
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
