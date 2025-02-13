import 'package:flutter/foundation.dart';
import 'package:found_team_assessment/models/details.dart';
import '../models/team_member.dart';

class DetailsScreenProvider with ChangeNotifier {
  final DetailsWallet _wallet = DetailsWallet(
    currentBalance: 100,
    winnings: 50,
    depositBalance: 30,
  );

  final List<TeamMember> _teammembers = [
    TeamMember(
      id: '1',
      role: "Team Member",
      name: 'Harshvardhan',
      performance: 20,
      tasks: 0,
      successRate: 0,
    ),
    TeamMember(
      id: '2',
      role: "Team Member",
      name: 'Harshvardhan',
      performance: 20,
      tasks: 0,
      successRate: 0,
    ),
  ];
  final List<TeamMember> pendingMembers = [
    TeamMember(
        id: '1',
        role: "Team Member",
        name: 'Alice Johnson',
        performance: 60,
        tasks: 5,
        successRate: 75),
    TeamMember(
      id: '2',
      role: "Team Member",
      name: 'Bob Brown',
      performance: 50,
      tasks: 3,
      successRate: 65,
    ),
    // Add more pending members
  ];

  DetailsWallet get wallet => _wallet;
  List<TeamMember> get members => [..._teammembers];

  void addMember(TeamMember member) {
    _teammembers.add(member);
    notifyListeners();
  }
}
