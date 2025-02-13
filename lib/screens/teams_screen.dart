import 'package:flutter/material.dart';
import 'package:found_team_assessment/models/team.dart';
import 'package:found_team_assessment/providers/team_provider.dart';
import 'package:found_team_assessment/screens/team_management_screen.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TeamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1F),
      body: SafeArea(
        child: Consumer<TeamsProvider>(
          builder: (context, teamsProvider, _) {
            return Column(
              children: [
                _buildHeader(teamsProvider),
                _buildTeamsList(teamsProvider, context),
                _buildBottomNavBar(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(TeamsProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Teams',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 4,
                    color: Color.fromRGBO(0, 82, 255, 1),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Archive',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              // Search Bar
              Container(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF2A3150), // Darker shade
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30), // 20 Border Radius
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )),
              const SizedBox(width: 110),

              // Create Team Button
              ElevatedButton(
                onPressed: () {
                  // Handle create team action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 82, 255, 1), // Blue button
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Create Team",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12), // Padding inside the container
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), // Rounded corners
              border: Border.all(
                color: Colors.grey, // Border color
                width: 1, // Border width
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Team Hub" title with lightning icon
                Row(
                  children: [
                    const Icon(Icons.bolt,
                        color: Colors.purple, size: 30), // Lightning icon

                    const Text(
                      "Team Hub",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12), // Spacing

                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard('Teams', provider.totalTeams.toString()),
                    _buildStatCard('Members', provider.totalMembers.toString()),
                    _buildStatCard(
                        'Projects', provider.totalProjects.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String count) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F37),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamsList(TeamsProvider provider, BuildContext context) {
    final provider = TeamsProvider();
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: provider.teams.length,
        itemBuilder: (context, index) {
          final team = provider.teams[index];
          return _buildTeamCard(team, context);
        },
      ),
    );
  }

  Widget _buildTeamCard(Team team, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        //color: const Color(0xFF1A1F37),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      team.name[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        team.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: team.status == "active"
                                  ? Colors.green.withOpacity(0.6)
                                  : Colors.red.shade600,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              team.status,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            "1/5",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 40,
                lineWidth: 6,
                percent: team.progress,
                center: Text(
                  "${(team.progress * 100).toInt()}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                progressColor: Colors.blue,
                backgroundColor: Colors.grey.shade800,
              ),
              const SizedBox(width: 11), // Spacing between elements
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildProjectStats(" projects", team.activeProjects),
                    const SizedBox(height: 8),
                    _buildProjectStats("completed", team.completedProjects),
                    const SizedBox(
                        height: 20), 
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamManagementScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(0, 82, 255, 1),
                minimumSize: const Size(50, 35),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Manage Team',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12), 
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectStats(String title, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        Text(
          count.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF0A0E1F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(Icons.home, false),
          _buildNavBarItem(Icons.search, false),
          _buildNavBarItem(Icons.people, true),
          _buildNavBarItem(Icons.person, false),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, bool isSelected) {
    return Icon(
      icon,
      color: isSelected ? Colors.white : Color.fromRGBO(0, 82, 255, 1),
      size: 28,
    );
  }
}
