import 'package:calisthenics_gym_app/data/model/exercise_model.dart';
import 'package:flutter/material.dart';

class ExerciseDetailsViewModel extends ChangeNotifier{
  ExerciseDetailsViewModel({required ExerciseDetailsModel exerciseModel}) :
      _exerciseModel = exerciseModel;

  final ExerciseDetailsModel _exerciseModel;

  String GetTitle(){
    return _exerciseModel.title.toUpperCase();
  }

  NetworkImage GetImage(){
    return NetworkImage(_exerciseModel.coverImagePath);
  }

  String GetPrimaryMuscleGroup(){
    return _exerciseModel.primary.toString();
  }

  String GetSecondaryMuscleGroup(){
    return _exerciseModel.secondary.toString();
  }
}