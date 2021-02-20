import 'package:contribution_app/providers/providers.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppDrawer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    _appAbout() {
      return showAboutDialog(
        context: context,
        applicationIcon: FlutterLogo(),
        applicationName: 'Group Expence Manager',
        applicationVersion: '1.0.0',
      );
    }

    return Drawer(
        elevation: 4,
        child: ListView(
          children: [
            Consumer(
              builder: (context, watch, child) {
                return watch(userModelFutureProvider).when(
                  data: (user) {
                    return DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: UserAccountsDrawerHeader(
                        accountName: Text(
                          user.name,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        accountEmail: Text(
                          user.email,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(user.photoUrl),
                        ),
                      ),
                    );
                  },
                  loading: () {
                    return Center(child: CircularProgressIndicator());
                  },
                  error: (e, s) {
                    return Center(
                      child: Text(e.toString()),
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, Dashboard.route);
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              leading: Icon(Icons.pages),
              onTap: () {},
            ),
            ListTile(
              title: Text('Share'),
              leading: Icon(Icons.share),
              onTap: () {},
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.add_business_outlined),
              onTap: () {
                Navigator.pop(context);
                _appAbout();
              },
            ),
            Divider(),
            Spacer(),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
              ),
              child: ElevatedButton(
                child: Text(
                  'LogOut',
                ),
                onPressed: () async {
                  await context.read(authClassProvider).logOut();
                },
              ),
            ),
            Text('Developed by'),
            Text('  Purushottam', style: TextStyle(fontStyle: FontStyle.italic))
          ],
        ));
  }
}
