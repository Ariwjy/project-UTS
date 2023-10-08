import 'package:project_uts/SplashScreen/splash_screen.dart';
import 'package:project_uts/authentication/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uts/profile/model/user.dart';
import 'package:project_uts/profile/utils/user_preferences.dart';
import 'package:project_uts/profile/widgets/appbar_widget.dart';
import 'package:project_uts/profile/widgets/button_widget.dart';
import 'package:project_uts/profile/widgets/profile_widget.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage();

  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  TextEditingController aboutController = TextEditingController();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    loadAbout();
  }

  Future<void> loadAbout() async {
    _prefs = await SharedPreferences.getInstance();
    final user = UserPreferences.myUser;
    aboutController.text = _prefs.getString('about') ?? user.about;
  }

  Future<void> saveAbout() async {
    final value = aboutController.text;
    await _prefs.setString('about', value);
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 26),
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                Text(
                  'Address',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: buildEditableAbout(),
                  ),
                ),
                const SizedBox(height: 24),
                buildUpgradeButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            user.nohp,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildEditableAbout() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: TextField(
          controller: aboutController,
          decoration: InputDecoration(
            labelText: 'Address',
            border: OutlineInputBorder(),
          ),
          maxLines: null,
          onChanged: (value) {
            saveAbout();
          }, // Agar bisa mengedit teks dengan beberapa baris
        ),
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Log Out',
        onClicked: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => MySpalshScreen()),
          );
        },
      );
}
