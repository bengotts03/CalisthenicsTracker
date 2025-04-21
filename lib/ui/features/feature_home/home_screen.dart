import 'package:auto_route/annotations.dart';
import 'package:calisthenics_gym_app/ui/core/shared_widgets/appbar/appbar_content_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarContentWidget(
      title: "Cali Tracker",
      subtitle: _buildWelcomeMessage(),
      actions: _buildAppBarActions(),
      extraContent: _BuildWorkoutProgress(),
      child: _BuildBody(),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        icon: const Icon(Icons.notifications, color: Colors.white),
        onPressed: () {
          // Add notification handling logic
        },
      ),
      IconButton(
        icon: const Icon(Icons.settings, color: Colors.white),
        onPressed: () {
          // Add settings handling logic
        },
      )
    ];
  }
  String _buildWelcomeMessage() {
    final user = FirebaseAuth.instance.currentUser;
    return 'Welcome back, ${user?.displayName ?? 'User'}!';
  }
}

Widget _BuildWorkoutProgress() {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.trending_up,
                  color: Colors.white.withOpacity(0.7),
                  size: 18,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Weekly Progress',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            const Text(
              '75%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        // Progress bar
        Container(
          margin: const EdgeInsets.only(top: 8),
          width: double.infinity,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            widthFactor: 0.75, // TODO: Percent Value here
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),

        // Stats row
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BuildStatItem('Streak', '12 days'),
              _BuildStatItem('Workouts', '4 this week'),
              _BuildStatItem('Level', 'Intermediate'),
            ],
          ),
        ),
      ],
    ),
  );
}
Widget _BuildStatItem(String label, String value) {
  return Column(
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7)),
      ),
      const SizedBox(height: 4),
      Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ],
  );
}

Widget _BuildBody() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _BuildDailyOverview(),
          const Divider(),
          _BuildWeeklyInsights(),
          const Divider(),
          _BuildQuickActions(),
        ],
      ),
    ),
  );
}

Widget _BuildDailyOverview() {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Overview",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        _BuildOverviewItem(
          Icons.heart_broken,
          "Recovery Status",
          "Great",
          Colors.green,
        ),
        const SizedBox(height: 8),
        _BuildOverviewItem(
          Icons.calendar_today,
          "Today's Schedule",
          "Pull",
          null,
        ),
      ],
    ),
  );
}
Widget _BuildOverviewItem(IconData icon, String label, String value, Color? conditionColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // This Row needs constraints - wrap it in Expanded
      Expanded(
        child: Row(
          children: [
            Icon(icon, color: Colors.indigoAccent),
            const SizedBox(width: 8),
            Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
      // Add some padding for separation
      const SizedBox(width: 8),
      // Value text also needs to handle overflow
      Text(
        value,
        style: TextStyle(color: conditionColor ?? Colors.black, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}

// Similarly, fix the _BuildWeeklyInsights function's Row for days of the week
Widget _BuildWeeklyInsights() {
  return Container(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Weekly Insights",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        _BuildOverviewItem(Icons.trending_up, "Weekly Volume", "4000kg", null),
        const SizedBox(height: 10),
        // Use Expanded widgets within the Row for even spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Expanded(child: Center(child: Text("M"))),
            Expanded(child: Center(child: Text("T"))),
            Expanded(child: Center(child: Text("W"))),
            Expanded(child: Center(child: Text("T"))),
            Expanded(child: Center(child: Text("F"))),
            Expanded(child: Center(child: Text("S"))),
            Expanded(child: Center(child: Text("S"))),
          ],
        ),
      ],
    ),
  );
}

Widget _BuildQuickActions() {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Actions",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _BuildQuickActionButton(
              icon: Icons.trending_up,
              label: "View Progress",
              onPressed: () {
                // Add action
              },
            ),
            _BuildQuickActionButton(
              icon: Icons.fitness_center,
              label: "Start Recommended",
              onPressed: () {
                // Add action
              },
            ),
          ],
        ),
      ],
    ),
  );
}
Widget _BuildQuickActionButton({required IconData icon, required String label, required VoidCallback onPressed}) {
  return Column(
    children: [
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.indigo,
        ),
        child: Icon(icon, color: Colors.white),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    ],
  );
}