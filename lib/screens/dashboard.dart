import 'package:contribution_app/models/models.dart';
import 'package:contribution_app/providers/providers.dart';

import 'package:contribution_app/shared/appDrawer.dart';
import 'package:contribution_app/shared/widgets.dart';
import 'package:contribution_app/widgets/project_Item.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Dashboard extends StatelessWidget {
  static const route = '/dashboard';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController projectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> _save(BuildContext context) {
      if (formKey.currentState.validate()) {
        Project project = Project(
          title: projectController.text,
          id: Uuid().v4(),
        );
        context.read(addPrivateProjectProvider(project));
        Navigator.pop(context);
      }
    }

    void addNewProjectDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add new project'),
            content: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: TextFormField(
                validator: (v) {
                  if (v.isEmpty) {
                    return 'project name can\'t empty';
                  }
                },
                controller: projectController,
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'project name'),
              ),
            ),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _save(context);
                      },
                      child: Text('add'))
                ],
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: AppDrawer(),
      body: Consumer(
        builder: (_, watch, child) {
          return Container(
            padding: const EdgeInsets.only(bottom: 20),
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
      floatingActionButton: bottomNavigation('add new Project', () {
        // Navigator.pushNamed(context, AddProject.route);
        addNewProjectDialog();
      }),
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
