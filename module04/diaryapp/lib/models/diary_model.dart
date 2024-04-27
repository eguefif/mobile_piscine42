import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Feeling {
  smile("assets/smile.svg", "smile"),
  anger("assets/angry.svg", "anger"),
  neutral("assets/neutral.svg", "neutral"),
  sad("assets/neutral.svg", "sad");
  
  const Feeling(this.asset, this.description);
  final String asset;
  final String description;
}

class DiaryModel extends ChangeNotifier {
  final List<Entry> _entries = <Entry>[];
  String? token;
  Credentials? _credentials;
  CollectionReference? entriesFirebase;
  String? email;

  Future<void> connectToFireBase(credentials) async {
    _credentials = credentials;
    await _getEntries();
  }

  void removeCredentials() {
    _credentials = null;
  }

  @override
  void dispose() {
    super.dispose();
    _entries.clear();
  }

  Future<void> _getEntries() async {
    if (_credentials == null) {
      return;
    }
    _entries.clear();
    String token = await _authApi(_credentials);
    email = _credentials?.user.email;
    try {
      await FirebaseAuth.instance.signInWithCustomToken(token);
      entriesFirebase = FirebaseFirestore.instance.collection('diary_entries');
      QuerySnapshot snapshot = await entriesFirebase!.get();
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
    _entries.sort((a, b) => b.date - a.date);
    debugPrint(_entries.toString());
      notifyListeners();
    } catch (e) {
      debugPrint("FIREBASE ERROR $e");
    }
  }

  void addEntry(Entry entry) {
    _entries.add(entry);
    _entries.sort((a, b) => b.date - a.date);
    try {
      entriesFirebase!.add(
        {
          "title": entry.title,
          "content": entry.content,
          "date": entry.date,
          "feeling": entry.feeling,
          "email": email,
        },
      );
    } catch (e) {
      debugPrint("ADD FIREBASE: $e");
    }
    notifyListeners();
  }

  void deleteEntry(Entry entry) {
    _entries.remove(entry);
    notifyListeners();
  }

  Entry getEntry(int index){
    return _entries[index];
  }

  List<Entry> get entries => _entries;
}

class Entry {
  final String title;
  final int date;
  final String feeling;
  final String content;

  const Entry(
      {required this.title,
      required this.date,
      required this.feeling,
      required this.content});
}

Future<String> _authApi(credentials) async {
  //const url = "http://c1r7p10.42quebec.com/";
  const url = "http://10.0.2.2:8000/";
  if (credentials != null) {
    var retval = await http.get(Uri.parse(url), headers: {
      "authorization": "Bearer ${credentials!.idToken}",
      "name": "${credentials!.user.name}",
      "email": "${credentials!.user.email}",
    });
    var token = jsonDecode(retval.body)["token"];
    return token;
  }
  return "";
}
