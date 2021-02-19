import 'package:contribution_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:contribution_app/providers/providers.dart';
import 'package:uuid/uuid.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _formState = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future _save(BuildContext context) {
      if (_formState.currentState.validate()) {
        Project project = Project(
          title: _titleController.text,
          id: Uuid().v4(),
        );
        context.read(addProjectProvider(project));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('Add Project'),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: _formState,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'title must not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Project title',
                  labelText: 'title',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  _save(context);
                  Navigator.pop(context);
                },
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
