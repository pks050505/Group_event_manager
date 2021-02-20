import 'package:contribution_app/screens/screens.dart';

bottomNavigation(String title, Function onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          SizedBox(
            width: 10,
          ),
          Text(title)
        ],
      ),
    ),
  );
}
