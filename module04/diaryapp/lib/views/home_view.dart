import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/login_view.dart';
import 'package:diaryapp/views/profile_view.dart';
import 'package:diaryapp/views/widget/buttons/login_button.dart';
import 'package:diaryapp/views/widget/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<HomePage> {
  Credentials? _credentials;
  late Auth0 auth0;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0("dev-eayo2wlpb6l2zzk4.us.auth0.com",
        "RbVVflQxregPjQvQnbYLpS9bzMTH4C5b");
  }

  void logout() async {
    await auth0.webAuthentication(scheme: "demo").logout(useHTTPS: true);
    setState(
      () {
        if (_credentials != null) {
          _credentials = null;
        }
      },
    );
  }

  void login() async {
    final credentials =
        await auth0.webAuthentication(scheme: "demo").login(useHTTPS: true);
    setState(() {
      _credentials = credentials;
    });
    try {
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        await Provider.of<DiaryModel>(context, listen: false)
            .connectToFireBase(credentials);
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _credentials == null
        ? LoginView(login: login)
        : ProfileView(
            logout: logout);
  }
}