class Team {
  final String id;
  final String name;
  final int activeProjects;
  final int completedProjects;
  final String teamLead;
  final double progress; 
  final String status; 

  Team({
    required this.id,
    required this.name,
    required this.activeProjects,
    required this.completedProjects,
    required this.teamLead,
    required this.progress,
    required this.status
  });
}