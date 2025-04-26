import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calisthenics_gym_app/router/router.dart';
import 'package:calisthenics_gym_app/ui/core/shared_widgets/appbar/appbar_content_provider.dart';
import 'package:calisthenics_gym_app/ui/features/feature_browse/browse_screen.dart';
import 'package:flutter/material.dart';

class WorkoutHistoryModel {
  final String title;
  final String description;
  final Duration duration;
  //final Exercise[] exercisesInWorkout;

  WorkoutHistoryModel(this.title, this.description, this.duration);
}
class WorkoutRoutineElement extends StatelessWidget {
  final String workoutTitle;
  final String workoutDescription;
  final int exerciseInRoutine;

  const WorkoutRoutineElement({
    super.key,
    this.workoutTitle = "Unnamed Routine",
    this.workoutDescription = "No Description",
    this.exerciseInRoutine = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding inside the card
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Vertically center the row content
          children: [
            Icon(
              Icons.fitness_center,
              color: Colors.indigo,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    workoutTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Handle long titles
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        workoutDescription,
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text("$exerciseInRoutine exercises"),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24, // Adjust icon size
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
class WorkoutScreen extends StatelessWidget implements AppBarContentProvider{
  const WorkoutScreen({super.key});

  void OnClick_StartQuickWorkout(BuildContext context){
    debugPrint("Start Quick Workout");
  }

  void OnClick_CreateNew(BuildContext context){
    debugPrint("Create New Workout");
  }

  void OnClick_Browse(BuildContext context){
    //TODO: should route with id in the future instead of using the exercise name "pull-up" as the id
    //TODO: re-route so this takes you to a browser of exercises and routines
    debugPrint("Browse");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Overall padding for the screen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children horizontally
          children: [
            MaterialButton(
              onPressed: () => OnClick_StartQuickWorkout(context),
              color: Colors.indigoAccent,
              minWidth: double.infinity,
              height: 50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Adjust radius
              child: const Text(
                "+ Start Empty Workout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Routines",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => OnClick_Browse(context),
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 12), // Added top padding to the list
                children: const [
                  WorkoutRoutineElement(),
                  WorkoutRoutineElement(),
                  WorkoutRoutineElement(),
                  // Add more WorkoutRoutineElements here as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget? buildAppBarExtraContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SearchBar(
        hintText: 'Search routines or exercises...',
        leading: const Icon(Icons.search, color: Colors.white),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(Colors.indigoAccent),
        textStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white)),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        constraints: const BoxConstraints(maxHeight: 45, minHeight: 45),
      ),
    );
  }
  @override
  List<Widget> getAppBarActions() {
    return [
      IconButton(
        icon: const Icon(Icons.search, color: Colors.white),
        onPressed: () {
          // Add notification handling logic
        },
      ),
      IconButton(
        icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
        onPressed: () {
          // Add settings handling logic
        },
      )
    ];
  }
  @override
  String getAppBarSubtitle() {
    return "";
  }
  @override
  String getAppBarTitle() {
    return "Workouts";
  }
}