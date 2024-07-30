import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:response_app/auth_service.dart';

// Mock class for FirebaseAuth
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Mock class for UserCredential
class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late AuthenticationService authenticationService;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authenticationService = AuthenticationService(mockFirebaseAuth);
  });

  group('AuthenticationService', () {
    test('signIn returns "Signed in" when successful', () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password123';
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .thenAnswer((_) async => MockUserCredential());

      // Act
      final result = await authenticationService.signIn(email, password);

      // Assert
      expect(result, 'Signed in');
    });

    test('signIn returns error message when FirebaseAuthException is thrown',
        () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password123';
      final errorMessage = 'An error occurred';
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .thenThrow(
              FirebaseAuthException(message: errorMessage, code: 'error'));

      // Act
      final result = await authenticationService.signIn(email, password);

      // Assert
      expect(result, errorMessage);
    });

    test('signUp returns "Signed up" when successful', () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password123';
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .thenAnswer((_) async => MockUserCredential());

      // Act
      final result = await authenticationService.signUp(email, password);

      // Assert
      expect(result, 'Signed up');
    });

    test('signUp returns error message when FirebaseAuthException is thrown',
        () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password123';
      final errorMessage = 'An error occurred';
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .thenThrow(
              FirebaseAuthException(message: errorMessage, code: 'error'));

      // Act
      final result = await authenticationService.signUp(email, password);

      // Assert
      expect(result, errorMessage);
    });

    test('signOut calls FirebaseAuth signOut method', () async {
      // Act
      await authenticationService.signOut();

      // Assert
      verify(mockFirebaseAuth.signOut()).called(1);
    });

    test('authStateChanges returns FirebaseAuth authStateChanges stream', () {
      // Arrange
      final user = User(
        uid: '123',
        displayName: 'Test User',
        email: 'test@example.com',
      );
      final authStateChangesStream = Stream<User?>.value(user);
      when(mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => authStateChangesStream);

      // Act
      final stream = authenticationService.authStateChanges;

      // Assert
      expect(stream, authStateChangesStream);
    });
  });
}
