import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:response_app/home_screen.dart'; // Make sure the import path matches your project structure

void main() {
  testWidgets('HomeScreen UI and navigation tests', (WidgetTester tester) async {
    // Build the HomeScreen widget.
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Verify the AppBar title.
    expect(find.text('Home'), findsOneWidget);

    // Verify navigation buttons are present.
    final emergencyButtonFinder = find.widgetWithText(Card, 'Emergency Services');
    final profileButtonFinder = find.widgetWithText(Card, 'Profile');
    expect(emergencyButtonFinder, findsOneWidget);
    expect(profileButtonFinder, findsOneWidget);

    // Tap on the 'Emergency Services' navigation button.
    await tester.tap(emergencyButtonFinder);
    await tester.pumpAndSettle(); // This simulates the completion of any animations triggered by the tap.

    // After the tap, assuming you push a new route, check if the 'Emergency Services' screen is pushed.
    // This step requires the EmergencyServicesScreen widget to be properly implemented and imported.
    expect(find.byType(EmergencyServicesScreen), findsOneWidget);

    // Verify bottom navigation bar items are present and can be tapped.
    expect(find.byIcon(Icons.local_hospital), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    // Verify that tapping 'Profile' updates the selected index in the BottomNavigationBar.
    expect(find.text('Profile'), findsWidgets); // Adjust based on how the UI updates

    // Verify the welcome message.
    expect(find.text('Welcome, User!'), findsOneWidget);
  });
}

class EmergencyServicesScreen {
}
