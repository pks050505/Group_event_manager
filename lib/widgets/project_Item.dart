import 'package:contribution_app/models/models.dart';
import 'package:contribution_app/screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:contribution_app/providers/providers.dart';
import 'package:intl/intl.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  ProjectItem(this.project);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProjectScreen.route);
        context.read(projectIdPro).state = project.id;
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green)),
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                project.title,
                style: GoogleFonts.notoSans(
                    textStyle: Theme.of(context).textTheme.headline5),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  DateFormat.MMMEd().format(project.createdTime.toDate()),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          AlertDialog(
                            title: Text('Delete'),
                            content: Text('Are you sure?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancle'),
                              ),
                              Spacer(),
                              ElevatedButton(
                                child: Text('Delete'),
                                onPressed: () {
                                  context
                                      .read(deleteProjectFutureProvider)
                                      .whenData((value) {
                                    Navigator.pop(context);
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('$value'),
                                      duration: Duration(seconds: 5),
                                    ));
                                  });
                                },
                              )
                            ],
                          );
                        });
                    // context.read(deleteProjectFutureProvider);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
