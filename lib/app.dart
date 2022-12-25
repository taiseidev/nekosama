import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/gen/fonts.gen.dart';
import 'package:nekosama/ui/router/router.dart';
import 'package:nekosama/ui/widgets/loading.dart';
import 'package:nekosama/utils/loading.dart';
import 'package:nekosama/utils/scaffold_messenger_service.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingProvider);

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        final router = ref.watch(routerProvider);
        return MaterialApp.router(
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          debugShowCheckedModeBanner: false,
          // navigatorKey: ref.watch(navigatorKeyProvider),
          scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: FontFamily.notoSansJP,
          ),
          builder: (context, child) {
            return Stack(
              children: [
                MediaQuery(
                  // 端末依存のフォントを1に固定
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: child!,
                ),
                // ローディングを表示
                if (isLoading)
                  const ColoredBox(
                    color: Colors.black26,
                    child: PrimaryLoading(),
                  )
              ],
            );
          },
        );
      },
    );
  }
}
