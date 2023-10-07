import 'package:project_uts/data/user_data.dart';
import 'package:project_uts/profile/model/user.dart';

class UserPreferences {
  static User myUser = User(
    imagePath: 'Images/profile_driver.jpg',
    name: '${UserData.username}',
    email: '${UserData.email}',
    nohp: '${UserData.nohp}',
    about: 'Saya sudah tiga tahun menggunakan Bonceng!',
  );
}
