import 'package:flutter/foundation.dart';
import '../models/team_member.dart';
import '../models/team_wallet.dart';

class TeamManagementProvider with ChangeNotifier {
  final TeamWallet _wallet = TeamWallet(
    currentBalance: 100,
    earnings: 50,
    spending: 30,
  );

  final List<TeamMember> _members = [
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
    TeamMember(
      id: '3',
      role: "Team Member",
      name: 'Harshvardhan',
      performance: 20,
      tasks: 0,
      successRate: 0,
    ),
    TeamMember(
      id: '4',
      role: "Team Member",
      name: 'Harshvardhan',
      performance: 20,
      tasks: 0,
      successRate: 0,
    ),
  ];

  TeamWallet get wallet => _wallet;
  List<TeamMember> get members => [..._members];

  void addMember(TeamMember member) {
    _members.add(member);
    notifyListeners();
  }
}
