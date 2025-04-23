import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calisthenics_gym_app/router/router.dart';
import 'package:calisthenics_gym_app/ui/features/feature_browse/browse_screen.dart';
import 'package:flutter/material.dart';

class WorkoutHistoryModel {
  final String title;
  final String description;
  final Duration duration;
  //final Exercise[] exercisesInWorkout;

  WorkoutHistoryModel(this.title, this.description, this.duration);
}
class WorkoutHistoryElement extends StatelessWidget {
  String workoutTitle = '';
  String workoutDescription = '';

  WorkoutHistoryElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.fitness_center),
        trailing: Icon(Icons.more_vert),
        title: Text(workoutTitle),
        subtitle: Text(workoutDescription),
        isThreeLine: true,
      ),
    );
  }
}

@RoutePage()
class WorkoutScreen extends StatelessWidget{
  const WorkoutScreen({super.key});

  void OnClick_StartQuickWorkout(BuildContext context){
    print("Start Quick Workout");
  }

  void OnClick_CreateNew(BuildContext context){
    print("Create New Workout");
  }

  void OnClick_Browse(BuildContext context){
    //TODO: should route with id in the future instead of using the exercise name "pull-up" as the id
    //TODO: re-route so this takes you to a browser of exercises and routines
    context.router.push(WorkoutBrowseRoute());
    print("Browse");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Quick Start"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () => OnClick_StartQuickWorkout(context),
                  child: Text(
                    "Start New Workout",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text("Routines"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 25,
                  children: [
                    ElevatedButton(
                      onPressed: () => OnClick_CreateNew(context),
                      child: Text(
                        "Create New",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => OnClick_Browse(context),
                      child: Text(
                        "Browse",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Text("My Routines"),
              ListView(
                shrinkWrap: true,
                children: [
                  WorkoutHistoryElement(),
                  WorkoutHistoryElement()
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}