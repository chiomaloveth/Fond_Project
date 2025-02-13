import 'package:flutter/material.dart';
import 'package:found_team_assessment/models/details.dart';
import 'package:found_team_assessment/models/team_member.dart';
import 'package:found_team_assessment/providers/details_screen_provider.dart';
import 'package:found_team_assessment/screens/add_member_screen.dart';
import 'package:found_team_assessment/screens/teams_screen.dart';
import 'package:provider/provider.dart';
import 'package:found_team_assessment/providers/screen_provider.dart';

class BankDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background content (TeamManagementUI)
          TeamManagementUI(),

          // BankDetailsForm or SuccessScreen as a sliding-up dialog
          Consumer<ScreenProvider>(
            builder: (context, provider, child) {
              return AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: provider.showBankDetails || provider.showSuccessScreen
                    ? 0
                    : -MediaQuery.of(context).size.height,
                left: 0,
                right: 0,
                child: provider.showSuccessScreen
                    ? SuccessScreen()
                    : BankDetailsForm(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TeamManagementUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1F),
      body: SafeArea(
        child: Consumer<DetailsScreenProvider>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  _buildWallet(provider.wallet, context),
                  _buildTeamMembers(provider.members, context),
                  _buildPendingMembers(provider.pendingMembers, context),
                  _buildTeamPerformance(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamsScreen(),
                  ),
                );
              }),
          const Text(
            'Team Management',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWallet(DetailsWallet wallet, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F37),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Team Wallet',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Current Balance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      Text(
                        '\$${wallet.currentBalance}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Winnings",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 230,
                      ),
                      Text(
                        '\$${wallet.winnings}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Deposit Balance",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      Text(
                        '\$${wallet.depositBalance}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // TextFormField for "Amount"
              Expanded(
                flex: 3,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount....',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Invest Button
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 82, 255, 1),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Deposit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Withdraw Button
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<ScreenProvider>(context, listen: false)
                        .toggleBankDetails();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(0, 82, 255, 1),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Withdraw'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMembers(List<TeamMember> members, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F37),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Team Members',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddMemberScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(0, 82, 255, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Add Member'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: members.length,
              itemBuilder: (context, index) {
                final member = members[index];
                return _buildMemberItem(member);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingMembers(List<TeamMember> members, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F37),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pending Invitations',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200, // Set a fixed height for the ListView
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: members.length,
              itemBuilder: (context, index) {
                final member = members[index];
                return _buildMemberItem(member);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberItem(TeamMember member) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF242B4A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to top
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              member.name[0],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 15),

          // Name and Role
          Container(
            width: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle long names
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Text(
                  member.role,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle long names
                  maxLines: 1,
                ),
              ],
            ),
          ),

          const SizedBox(width: 5),

          // Vertical Divider
          Container(
            width: 2,
            height: 40,
            color: Colors.white,
          ),

          const Spacer(),

          // Performance Metrics
          Container(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPerformanceIndicator('Performance', member.performance),
                _buildPerformanceIndicator('Tasks', member.tasks),
                _buildPerformanceIndicator('Success Rate', member.successRate),
              ],
            ),
          ),

          // More Options Icon
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              alignment: Alignment.topCenter,
              child: const Icon(
                Icons.more_vert,
                color: Colors.grey,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceIndicator(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${value.toStringAsFixed(0)}%',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildTeamPerformance() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F37),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Team Performance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildPerformanceBar('Overall', 0.7),
          _buildPerformanceBar('Timeline', 0.8),
          _buildPerformanceBar('Quality', 0.6),
          _buildPerformanceBar('Collaboration', 0.9),
        ],
      ),
    );
  }

  Widget _buildPerformanceBar(String label, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey[800],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }
}

class BankDetailsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bank Details:",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  width: 170,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Hide the SuccessScreen
                      Provider.of<ScreenProvider>(context, listen: false)
                          .toggleBankDetails();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bank Name",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account Number",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  labelText: "Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account Holder Name",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "IFSC Code",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  labelText: "IFSC",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Consumer<ScreenProvider>(
                builder: (context, provider, child) {
                  return Checkbox(
                    value: provider.isChecked,
                    onChanged: (value) {
                      provider.toggleCheckbox(value!);
                    },
                    activeColor: Color.fromRGBO(0, 82, 255, 1),
                  );
                },
              ),
              RichText(
                text: TextSpan(
                  text: "Accept Terms and ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "Condition",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 82, 255, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Provider.of<ScreenProvider>(context, listen: false)
                  .toggleSuccessScreen();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(0, 82, 255, 1),
              minimumSize: Size(double.infinity, 50),
              side: BorderSide(
                color: Colors.black, // Border color
                width: 1,
                // Border width
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Provider.of<ScreenProvider>(context, listen: false)
                  .toggleBankDetails();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
              side: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(children: [
        // Close button at top-right
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: Icon(
              Icons.close,
              size: 30,
              color: Colors.grey,
            ),
            onPressed: () {
              // Hide the SuccessScreen
              Provider.of<ScreenProvider>(context, listen: false)
                  .toggleBankDetails();
            },
          ),
        ),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Color.fromRGBO(0, 82, 255, 1),
              size: 150,
            ),
            SizedBox(height: 15),
            Text(
              'Success',
              style: TextStyle(
                color: Color.fromRGBO(0, 82, 255, 1),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'You can track your status in withdraw history',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Withdraw History or Status Screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                side: BorderSide(
                  color: Colors.black, // Border color
                  width: 2, // Border width
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Status',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ]),
    );
  }
}
