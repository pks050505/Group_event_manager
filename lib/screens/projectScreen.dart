import 'package:contribution_app/providers/providers.dart';
import 'package:contribution_app/screens/screens.dart';

// final currentIndexProvider = StateProvider<int>((ref) {
//   return 0;
// });
// final showFabboolProvider =
//     StateProvider.family.autoDispose<bool, PageController>((ref, controller) {
//   if (controller.position.axisDirection == AxisDirection.down) {
//     return false;
//   }
//   return true;
// });

// class ProjectScreen extends ConsumerWidget {
//   static const route = '/projectScreen';
//   PageController controller;
//   int initialPage;
//   @override
//   Widget build(BuildContext context, watch) {
//     controller = PageController(
//       initialPage: watch(currentIndexProvider).state,
//     );
//     var _pages = [
//       UserDonation(),
//       UserExpence(),
//     ];
//     // final project = ModalRoute.of(context).settings.arguments as Project;

//     return Scaffold(
//       // appBar: PreferredSize(
//       //     preferredSize: Size.fromHeight(150),
//       //     child: Container(
//       //       color: Colors.amber,
//       //       child: Column(
//       //         crossAxisAlignment: CrossAxisAlignment.center,
//       //         mainAxisAlignment: MainAxisAlignment.center,
//       //         children: [
//       //           Text(
//       //             'All user',
//       //             style: Theme.of(context).textTheme.headline3,
//       //           )
//       //         ],
//       //       ),
//       //     )),
//       // appBar: PreferredSize(
//       //   preferredSize: Size.fromHeight(100),
//       //   child: _ProjectAppBar(),
//       // ),
//       // body: Container(
//       //   child: _pages[watch(currentIndexProvider).state],
//       // ),
//       body: PageView(
//         controller: controller,
//         onPageChanged: (change) {},
//         children: _pages,
//         physics: BouncingScrollPhysics(),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.access_alarm_outlined), label: 'Add Customer'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_balance),
//             label: 'Expence',
//           ),
//         ],
//         currentIndex: watch(currentIndexProvider).state,
//         onTap: (index) {
//           switch (index) {
//             case 0:
//               context.read(currentIndexProvider).state = index;

//               break;
//             case 1:
//               context.read(currentIndexProvider).state = index;
//               break;
//           }
//         },
//       ),
//     );
//   }
// }

// class _ProjectAppBar extends StatelessWidget {
//   const _ProjectAppBar({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//         gradient: LinearGradient(colors: [
//           Colors.purple,
//           Colors.pink,
//         ]),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text('Total  1000'),
//           Text('Expence 600'),
//           Text('Remaning 400')
//         ],
//       ),
//     );
class ProjectScreen extends StatefulWidget {
  static const route = '/projectScreen';
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

final currentPageIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class _ProjectScreenState extends State<ProjectScreen> {
  var controller;
  void updatePage(BuildContext context, int page) {
    context.read(currentPageIndexProvider).state = page;
  }

  var _pages = [
    UserDonation(),
    UserExpence(),
  ];
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    controller = PageController(
      initialPage: currentIndex,
      keepPage: true,
    );
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer(
            builder: (_, watch, child) {
              return PageView.builder(
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _pages[index];
                },
                controller: controller,
                onPageChanged: (pageIndex) => updatePage(context, pageIndex),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Consumer(builder: (context, watch, child) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
                label: 'Donation', icon: Icon(Icons.access_alarm_sharp)),
            BottomNavigationBarItem(
                label: 'Expence', icon: Icon(Icons.accessible)),
          ],
        );
      }),
    );
  }
}
