import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/entities/flow_project.dart';
import 'package:flow/providers/active_project_state.dart';
import 'package:flow/utils/backend_utils.dart';
import 'package:flow/view/projects/create_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  bool projectCreationProgress = false;

  showCreateProjectDialog() {
    showDialog(
        barrierDismissible: !projectCreationProgress,
        context: context,
        builder: (context) {
          return CreateProjectView(
            onCreate: (bool status) => setState(() => projectCreationProgress = status),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<QuerySnapshot<FlowProject>>(
            stream: dbProjectsRef.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.data == null) {
                return Container();
              }

              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.5),
                  itemCount: snapshot.data!.size,
                  itemBuilder: (context, index) {
                    FlowProject data = snapshot.data!.docs[index].data();
                    return GestureDetector(
                      onTap: () {
                        print("PROJ CHK INIT:: ${data.id}");
                        context.read<ActiveProjectState>().update(data);
                        Navigator.pushNamed(context, '/editor');
                      },
                      child: Card(
                        elevation: 5.0,
                        color: Colors.grey[800],
                        margin: const EdgeInsets.all(6),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                data.packageName,
                                style: const TextStyle(fontSize: 12),
                              ),
                              Expanded(child: Container()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Icon(
                                      Icons.navigate_next_rounded,
                                      size: 32,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
        Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              onPressed: () => showCreateProjectDialog(),
              label: const Text('Create Project'),
              icon: const Icon(Icons.add),
            ))
      ],
    );
  }
}
