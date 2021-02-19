import 'package:contribution_app/providers/providers.dart';
import 'package:contribution_app/route/addProject.dart';

import 'package:contribution_app/shared/appDrawer.dart';
import 'package:contribution_app/widgets/project_Item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/all.dart';

class Dashboard extends StatelessWidget {
  static const route = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: AppDrawer(),
      body: Consumer(
        builder: (_, watch, child) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: watch(listOfProjectStreamProvider).when(
              data: (val) {
                return ListView.builder(
                  itemCount: val.length ?? 0,
                  itemBuilder: (_, i) {
                    return ProjectItem(val[i]);
                  },
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (e, s) => Text(e.toString()),
            ),
          );
        },
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        elevation: 4,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return AddProject();
          }));
        },
      ),
    );
  }
}

//  showModalBottomSheet(
//           context: context,
//           builder: (_) {
//             return Consumer(
//               builder: (context, watch, child) {
//                 final title = watch(projectTitleProvider).state;

//                 return Container(
//                   child: Column(
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(hintText: 'Title'),
//                         onChanged: (val) => projectTitle(context, val),
//                       ),
//                       TextField(
//                         decoration: InputDecoration(hintText: 'Title'),
//                         onChanged: (val) => projectTitle(context, val),
//                       ),
//                       ElevatedButton(
//                         onPressed: () async {
//                           context.read(
//                               addProjectProvider(Project(title: title)));
//                           Navigator.pop(context);
//                         },
//                         child: Text('Add Project'),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             );
//           });

//  onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (_) {
//                             return ProjectScreen(val[i]);
//                           }));
//                         },
