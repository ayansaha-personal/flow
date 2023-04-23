import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/entities/flow_access.dart';
import 'package:flow/entities/flow_container.dart';
import 'package:flow/entities/flow_project.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow/utils/backend_utils.dart';
import 'package:flutter/material.dart';

class CreateProjectView extends StatefulWidget {
  final Function(bool creating) onCreate;

  const CreateProjectView({Key? key, required this.onCreate}) : super(key: key);

  @override
  State<CreateProjectView> createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
  bool inProgress = false;
  TextEditingController projectNameController = TextEditingController();
  TextEditingController packageNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomRight,
      insetPadding: const EdgeInsets.only(bottom: 15, right: 15),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Create new project!'),
              Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: projectNameController,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                        labelText: 'Project name',
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: packageNameController,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                        labelText: 'Package / Domain name',
                        hintText: 'theburgeon.in',
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  inProgress
                      ? CircularProgressIndicator()
                      : TextButton(
                          onPressed: () async {
                            widget.onCreate(true);
                            setState(() {
                              inProgress = true;
                            });
                            FlowProject project = FlowProject(id: '', name: projectNameController.value.text, packageName: packageNameController.value.text, initialRoute: 'home');
                            DocumentReference reference = await dbProjectsRef.add(project);

                            FlowAccess access = FlowAccess(id: auth.currentUser!.uid, role: UserRoles.owner.json);
                            await dbProjectUserAccessRef(reference.id, auth.currentUser!.uid).set(access);
                            FlowContainer initWidget = FlowContainer(key: '', type: '');
                            DocumentReference widgetReference = await dbWidgetsRef(reference.id, 'home').add(initWidget.toDb());
                            await dbRoutesRef(reference.id).doc('home').set({'body': widgetReference.id}, SetOptions(merge: true));
                            widget.onCreate(false);
                            Navigator.pop(context);
                          },
                          child: const Text('Create')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
