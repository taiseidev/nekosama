import 'package:flutter/material.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/features/post/presentation/components/post_item.dart';
import 'package:nekosama/src/utils/constants/colors.dart';

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
                itemExtent: 1000,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: PostItem(),
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
