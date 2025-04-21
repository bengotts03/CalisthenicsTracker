import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class BaseExerciseModel{
  BaseExerciseModel(this.title);

  final String title;
}

class ExerciseDetailsModel extends BaseExerciseModel{
  ExerciseDetailsModel(super.title, this.description, this.coverImagePath, this.primary);

  final String coverImagePath;
  final String description;

  final MuscleGroup primary;
  late List<MuscleGroup> secondary = [];
}

class ExerciseRoutineModel extends BaseExerciseModel{
  ExerciseRoutineModel(super.title);


}

enum MuscleGroup {
  // Chest
  chest,

  // Back
  lats,
  upperBack,
  lowerBack,
  traps,

  // Shoulders
  frontDelts,
  sideDelts,
  rearDelts,
  rotatorCuff,

  // Arms
  biceps,
  triceps,
  forearms,

  // Core
  core,

  // Legs
  glutes,
  quadriceps,
  hamstrings,
  adductors,
  abductors,
  calves,
}