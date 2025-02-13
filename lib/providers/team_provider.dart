import 'package:flutter/foundation.dart';
import '../models/team.dart';

class TeamsProvider with ChangeNotifier {
  final List<Team> _teams = [
    Team(
        id: '1',
        name: 'Team Dhruv',
        activeProjects: 3,
        completedProjects: 0,
        teamLead: 'Dhruv',
        progress: 0.9,
        status: "inactive"),
    Team(
        id: '2',
        name: 'Team Chaun',
        activeProjects: 3,
        completedProjects: 0,
        teamLead: 'Chaun',
        progress: 0.2,
        status: "active"),
    Team(
        id: '3',
        name: 'Team Hassan',
        activeProjects: 3,
        completedProjects: 0,
        teamLead: 'Chaun',
        progress: 0.7,
        status: "active"),
    Team(
        id: '4',
        name: 'Team Moses',
        activeProjects: 3,
        completedProjects: 0,
        teamLead: 'Chaun',
        progress: 1.0,
        status: "inactive"),
    Team(
        id: '5',
        name: 'Team Karen',
        activeProjects: 3,
        completedProjects: 0,
        teamLead: 'Chaun',
        progress: 1.0,
        status: "active"),
    Team(
        id: '6',
        name: 'Team Mary',
        activeProjects: 3,
        completedProjects: 0,
        teamLead: 'Chaun',
        progress: 0.4,
        status: "inactive"),
    Team(
        id: '7',
        name: 'Team James',
        activeProjects: 3,
        completedProjects: 0,
        teamLead: 'Chaun',
        progress: 0.7,
        status: "active"),
    Team(
        id: '8',
        name: 'Team Lois',
        activeProjects: 3,
        completedProjects: 0,
        teamLead: 'Chaun',
        progress: 0.5,
        status: "active"),
  ];

  List<Team> get teams => [..._teams];

  int get totalTeams => _teams.length;
  int get totalMembers => _teams.length * 4; // Assuming 4 members per team
  int get totalProjects =>
      _teams.fold(0, (sum, team) => sum + team.activeProjects);
}
