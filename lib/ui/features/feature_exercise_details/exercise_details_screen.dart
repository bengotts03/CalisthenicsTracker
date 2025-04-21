import 'package:calisthenics_gym_app/data/model/exercise_model.dart';
import 'package:calisthenics_gym_app/ui/features/feature_exercise_details/exercise_details_view_model.dart';
import 'package:flutter/material.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  const ExerciseDetailsScreen({required this.viewModel});

  final ExerciseDetailsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: viewModel.GetImage(),
          height: 300,
          width: 600,
          fit: BoxFit.fitWidth
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.GetTitle(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "Primary: ${viewModel.GetPrimaryMuscleGroup()}",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              Text(
                "Secondary: ${viewModel.GetSecondaryMuscleGroup() ?? ""}",
                style: TextStyle(fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ],
    );
  }
}
