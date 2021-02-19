// import 'package:contribution_app/providers/providers.dart';
// import 'package:contribution_app/screens/screens.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../shared/appDrawer.dart';

// class Home extends StatefulWidget {
//   static const route = '/home';
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   var _pages = [Dashboard(), Expence()];
//   int _selectedItem = 0;
//   var _pageController = PageController();
//   var _items = [
//     BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: 'Home'),
//     BottomNavigationBarItem(
//         icon: Icon(FontAwesomeIcons.chartLine), label: 'Expence'),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Group Event Manager'),
//       //   actions: [],
//       // ),
//       drawer: AppDrawer(),
//       body: PageView(
//         children: _pages,
//         onPageChanged: (idx) {
//           setState(() {
//             _selectedItem = idx;
//           });
//         },
//         controller: _pageController,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: _items,
//         currentIndex: _selectedItem,
//         onTap: (idx) {
//           setState(() {
//             _selectedItem = idx;
//             _pageController.jumpToPage(_selectedItem);
//           });
//         },
//       ),
//     );
//   }
// }
