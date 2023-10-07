import 'package:project_uts/data/user_data.dart';
import 'package:project_uts/profile/model/user.dart';

class UserPreferences {
  static User myUser = User(
    imagePath: 'Images/profile_driver.jpg',
    name: '${UserData.username} ${UserData.username1}',
    email: '${UserData.email}',
    about: 'Saya sudah tiga tahun menggunakan JeKi',
    isDarkMode: false,
  );
}
