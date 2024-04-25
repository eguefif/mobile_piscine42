import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiaryModel extends ChangeNotifier {
  final List<Entry> _entries = <Entry>[];
  String? token;
  Credentials? _credentials;

  Future<void> connectToFireBase(credentials) async {
    _credentials = credentials;
    await _getEntries();
  }

  void removeCredentials() {
    _credentials = null;
  }

  Future<void> _getEntries() async {
    if (_credentials == null) {
      return;
    }
    String token = await _authApi(_credentials);
    try {
      await FirebaseAuth.instance.signInWithCustomToken(token);
      CollectionReference entries =
          FirebaseFirestore.instance.collection('diary_entries');
      QuerySnapshot snapshot = await entries.get();
      List<QueryDocumentSnapshot> list = snapshot.docs;
      for (var entry in list) {
        _entries.add(
          Entry(
            content: entry.get("content"),
            title: entry.get("title"),
            date: entry.get("date"),
            feeling: entry.get("feeling"),
          ),
        );
      }
      notifyListeners();
    } catch (e) {
      debugPrint("FIREBASE ERROR $e");
    }
  }

  void addEntry(Entry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  void deleteEntry(Entry entry) {
    _entries.remove(entry);
    notifyListeners();
  }

  List<Entry> get entries => _entries;
}

class Entry {
  final String title;
  final int date;
  final int feeling;
  final String content;

  const Entry(
      {required this.title,
      required this.date,
      required this.feeling,
      required this.content});
}

Future<String> _authApi(credentials) async {
  if (credentials != null) {
    var retval = await http.get(Uri.parse("http://10.0.2.2:8000/"), headers: {
      "authorization": "Bearer ${credentials!.idToken}",
      "name": "${credentials!.user.name}",
      "email": "${credentials!.user.email}",
    });
    var token = jsonDecode(retval.body)["token"];
    return token;
  }
  return "";
}
