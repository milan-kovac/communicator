import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LearningPageItems {
  final int id;
  final String learningType;
  final IconData icon;
  LearningPageItems({required this.id, required this.learningType, required this.icon});

  static List<LearningPageItems> getLearningPageItems() {
    return [
      LearningPageItems(id: 1, learningType: 'institutions', icon: FontAwesomeIcons.buildingColumns),
      LearningPageItems(id: 2, learningType: 'transport', icon: FontAwesomeIcons.bus),
      LearningPageItems(id: 3, learningType: 'food', icon: FontAwesomeIcons.burger),
      LearningPageItems(id: 4, learningType: 'numbers', icon: FontAwesomeIcons.one),
    ];
  }
}
