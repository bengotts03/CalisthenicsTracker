import 'package:calisthenics_gym_app/data/model/exercise_model.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseRoutineModel<T>{
  BaseRoutineModel(this.title, this.description);

  final String title;
  final String description;
  // TODO: Exercises within an active routine should be the details model as that should be for showing off an exercise in its own page,
  // this is probably best off being broken down into multiple types of routines, active, edit, inactive.
  late List<T> exercisesInRoutine;

  void AddExercise(T exercise){
    exercisesInRoutine.add(exercise);
  }
  void RemoveExercise(T exercise){
    exercisesInRoutine.remove(exercise);
  }
}

class ActiveRoutineModel extends BaseRoutineModel{
  ActiveRoutineModel(super.title, super.description);

}

class InactiveRoutineModel extends BaseRoutineModel{
  InactiveRoutineModel(super.title, super.description);

}

class EditRoutineModel extends BaseRoutineModel{
  EditRoutineModel(super.title, super.description);

}