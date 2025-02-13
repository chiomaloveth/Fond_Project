import 'package:flutter/material.dart';
import 'package:found_team_assessment/models/member.dart';

class MemberProvider extends ChangeNotifier {
  List<Member> members = List.generate(
    12,
    (index) => Member(
      name: 'Harshatalluv',
      role: "Team Member",
      performance: '20%',
      tasks: '0%',
      successRate: '0%',
    ),
  );

  void addMember(Member member) {
    // Implementation for adding member
    notifyListeners();
  }
}
