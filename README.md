# Team Management App

A Flutter-based team management application designed to help users manage team members, track performance, and handle withdrawals and deposits. The app includes features like team member management, performance tracking, and a user-friendly interface for managing team finances.

## Features

- **Team Member Management**: Add, edit, and view team members with details like name, role, performance, tasks, and success rate.
- **Performance Tracking**: Visualize team performance using progress indicators and performance metrics.
- **Bank Details Form**: A sliding-up form for entering bank details for withdrawals and deposits.
- **Success Screen**: Displays a success message with a checkmark and status button after submitting bank details.
- **Responsive Design**: The app is designed to work seamlessly on different screen sizes.
- **State Management**: Uses `Provider` for efficient state management across the app.



## Getting Started

### Prerequisites

- Flutter SDK (version 3.0.0 or higher)
- Dart SDK (version 2.17.0 or higher)
- Android Studio or VS Code (with Flutter and Dart plugins installed)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/chiomaloveth/Fond_Project.git
   cd Fond_project
   flutter pub get
   flutter run

   Code Structure
The project is organized into the following directories:

lib/

models/: Contains data models like TeamMember, DetailsWallet, etc.

providers/: Contains state management providers like ScreenProvider, DetailsScreenProvider, etc.

screens/: Contains the main screens of the app (e.g., TeamManagementScreen, BankDetailsScreen, AddMemberScreen).

widgets/: Contains reusable widgets like MemberCard, PerformanceIndicator, etc.

Key Widgets and Features
1. Team Management Screen
Displays team members, pending members, and team performance.

Includes a wallet section for tracking current balance, earnings, and spending.

Buttons for depositing and withdrawing funds.

2. Bank Details Form
A sliding-up form for entering bank details (bank name, account number, IFSC code, etc.).

Includes a checkbox for accepting terms and conditions.

Submitting the form displays a success screen.

3. Success Screen
Displays a success message with a checkmark.

Includes a "Status" button to track withdrawal history.

4. Add Member Screen
Allows users to add new team members.

Includes a search bar for filtering members by name, skill, or role.

5. Performance Indicators
Displays performance metrics like active projects, completed projects, and success rate.

Uses CircularPercentIndicator for visualizing progress.

State Management
The app uses the Provider package for state management. Key providers include:

ScreenProvider: Manages the visibility of the bank details form and success screen.

DetailsScreenProvider: Manages wallet details and team member data.

MemberProvider: Manages the list of team members and pending members.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments
Flutter for the awesome framework.

Provider for state management.

Circular Percent Indicator for progress visualization.

Developed with ❤️ by [Okereke Chioma]

Copy

---

### Key Sections:
1. **Project Overview**: A brief description of the app and its features.
2. **Screenshots**: Add screenshots of your app for visual reference.
3. **Installation**: Steps to clone, install dependencies, and run the app.
4. **Code Structure**: Explains the organization of the project.
5. **Key Widgets and Features**: Highlights the main widgets and features of the app.
6. **State Management**: Explains how state is managed using the `Provider` package.
7. **Customization**: Provides tips for customizing the app.
8. **Troubleshooting**: Common issues and how to resolve them.
9. **Contributing**: Guidelines for contributing to the project.
10. **License**: Information about the project's license.
11. **Acknowledgments**: Credits to libraries and tools used in the project.

---


