import 'package:contribution_app/screens/screens.dart';

bottomNavigation(String title, Function onTap) {
  return Material(
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: InkWell(
      splashColor: Colors.blue[100],
      onTap: onTap,
      child: Container(
        height: 50,
        width: 160,
        alignment: Alignment.center,
        // padding: EdgeInsets.all(8),
        //margin: EdgeInsets.only(bottom: 8),
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
    ),
  );
}
