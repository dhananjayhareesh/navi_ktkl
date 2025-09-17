import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import FlutterToast package
import 'package:navitask/features/homescreen/view/home_screen.dart';
import 'package:navitask/features/login_screen/repository/login_repo.dart';
import 'package:navitask/local_storage/shared_pref.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _authToken;

  bool get isLoading => _isLoading;
  String? get authToken => _authToken;

  // Login function to make the API call
  Future<void> login(Map<String, dynamic> payload, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await AuthenticationRepo.login(payload);
      print("Response status: ${response['status']}");

      if (response['status'] == true) {
        _authToken = response['token'];

        print("Auth Token: $_authToken");

        await MySharedPref.setAuthToken(_authToken!);

        Fluttertoast.showToast(
          msg: response['message'] ?? "Login successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        print("Login failed: ${response['message']}");

        Fluttertoast.showToast(
          msg: response['message'] ?? "Login failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print("Login error: $e");

      Fluttertoast.showToast(
        msg: 'Login error: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
