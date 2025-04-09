import 'package:flutter/material.dart';
import 'dashboard_page.dart';

abstract class AuthRepository {
  Future<bool> signIn(
    String username,
    String password,
  ); // Returns true on success
}

class MockAuthRepository implements AuthRepository {
  @override
  Future<bool> signIn(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    // Replace with actual Firebase call:
    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(email: username, password: password);
    //   return true; // Success
    // } on FirebaseAuthException catch (e) {
    //   print('Firebase Auth Error: ${e.code}'); // Log specific error
    //   return false; // Failure
    // } catch (e) {
    //   print('Generic Error: $e');
    //   return false; // Failure
    // }
    if (username == 'test' && password == 'pass') {
      // Simple mock logic
      return true;
    } else {
      // Simulate specific Firebase error for invalid credentials
      // throw FirebaseAuthException(code: 'invalid-credential'); // Example
      return false;
    }
  }
}

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  // Instantiate your AuthRepository (replace MockAuthRepository with your actual implementation)
  // In a real app, use dependency injection (GetIt, Provider, Riverpod)
  final AuthRepository _authRepository = MockAuthRepository();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _performLogin() async {
    // Made async
    // Hide keyboard
    FocusScope.of(context).unfocus();

    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      String errorMessage = 'An unexpected error occurred.'; // Default error

      try {
        // Call the actual authentication logic (replace with your service/repo)
        bool success = await _authRepository.signIn(
          _usernameController.text.trim(), // Trim whitespace
          _passwordController.text,
        );

        if (success && mounted) {
          // Check if widget is still in the tree
          // Navigate to Dashboard on success
          // Replace current page so user can't go back to login
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const DashboardPage()),
          );
          // If using named routes:
          // Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
          return; // Exit function after navigation
        } else if (!success) {
          errorMessage =
              'Invalid credentials.'; // Specific message for login failure
        }
      }
      // Example of catching specific Firebase errors
      // on FirebaseAuthException catch (e) {
      //   print("FirebaseAuthException code: ${e.code}");
      //   if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'invalid-credential') {
      //     errorMessage = 'Invalid credentials.';
      //   } else if (e.code == 'network-request-failed') {
      //      errorMessage = 'Network error. Please check your connection.';
      //   } else {
      //      errorMessage = 'An authentication error occurred.';
      //   }
      // }
      catch (e) {
        // Handle other potential errors (network, etc.)
        // Use a logging framework instead of print in production
        // print("Login Error: $e");
        errorMessage = 'Login failed. Please try again.';
      }

      // If login failed or error occurred, hide loading and show error
      if (mounted) {
        // Check if widget is still mounted before calling setState/ScaffoldMessenger
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor:
                Colors.red, // Use theme.colorScheme.error in build method
          ),
        );
      }
    } else {
      // Form is invalid
      setState(() {
        _isLoading = false;
      });
    }
  }

  // *** Function to handle Guest Sign In ***
  void _signInAsGuest() {
    // Use a logging framework instead of print in production
    // print('Signing in as Guest...');
    // Navigate directly to Dashboard, replacing the login screen
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const DashboardPage()));
    // If using named routes:
    // Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // *** Add the Image.asset widget here ***
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40.0,
                  ), // Add some spacing below the logo
                  child: Image.asset(
                    'assets/app_logo.png', // <<< Your asset path declared in pubspec.yaml
                    height: 100, // Adjust height as needed
                    // You can add width, fit properties etc.
                  ),
                ),

                // Username/ID Field
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username / ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username/ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Password/PIN Field
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password / PIN',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password/PIN';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),

                // Login Button
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                      onPressed: _performLogin,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text('Login'),
                    ),

                const SizedBox(height: 20),

                // Guest Login Button
                ElevatedButton(
                  onPressed: _signInAsGuest,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.grey, // Guest button color
                  ),
                  child: const Text('Login as Guest'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
