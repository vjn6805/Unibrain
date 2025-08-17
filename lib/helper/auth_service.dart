import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ValueNotifier<bool>{
  static final AuthService instance=AuthService._();

  final FlutterSecureStorage _secureStorage=FlutterSecureStorage();
  bool _isInitialized=false;

  AuthService._():super(false){
    checkLogin();
  }

  bool get isInitialized => _isInitialized;

  Future<void> login(String email,String password) async{
    await _secureStorage.write(key: "email", value: email);
    await _secureStorage.write(key: "password", value: password);
    notifyListeners();
  }

  Future<void> checkLogin() async{
    final email=await _secureStorage.read(key: 'email');
    final pass=await _secureStorage.read(key: 'password');
    value=email!=null && pass!=null;
    _isInitialized=true;
    notifyListeners();
  }

  Future<void> logout() async{
    await _secureStorage.delete(key: 'email');
    await _secureStorage.delete(key: 'password');
    value=false;
  }

  //getter methods
  Future<String?> getEmail()=>_secureStorage.read(key: 'email');
  Future<String?> getPassword()=>_secureStorage.read(key: 'password');


}

