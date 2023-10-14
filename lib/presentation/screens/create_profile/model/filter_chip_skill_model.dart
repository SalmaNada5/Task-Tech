import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FilterChipSkillModel extends Equatable {
 String chipName;
 bool isSelected;
  FilterChipSkillModel({required this.chipName, this.isSelected = false});
  @override
  List<Object?> get props => [chipName, isSelected];
}
