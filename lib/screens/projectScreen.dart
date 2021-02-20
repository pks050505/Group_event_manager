import 'package:contribution_app/providers/providers.dart';
import 'package:contribution_app/screens/screens.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class ProjectScreen extends ConsumerWidget {
  static const route = '/projectScreen';

  @override
  Widget build(BuildContext context, watch) {
    var _pages = [
      UserDonation(),
      UserExpence(),
    ];
    // final project = ModalRoute.of(context).settings.arguments as Project;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Container(
            color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'All user',
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          )),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100),
      //   child: _ProjectAppBar(),
      // ),
      body: Container(
        child: _pages[watch(currentIndexProvider).state],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_outlined), label: 'Add Customer'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Expence',
          ),
        ],
        currentIndex: watch(currentIndexProvider).state,
        onTap: (index) {
          switch (index) {
            case 0:
              context.read(currentIndexProvider).state = index;

              break;
            case 1:
              context.read(currentIndexProvider).state = index;
              break;
          }
        },
      ),
    );
  }
}

class _ProjectAppBar extends StatelessWidget {
  const _ProjectAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(colors: [
          Colors.purple,
          Colors.pink,
        ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Total  1000'),
          Text('Expence 600'),
          Text('Remaning 400')
        ],
      ),
    );
  }
}
