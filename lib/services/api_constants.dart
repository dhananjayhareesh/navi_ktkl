import '../utils/enum.dart';

class BaseUrl {
  static AppBuild buildType = AppBuild.dev;
  static String developmentUrl = "https://flutter-amr.noviindus.in/";
  //http://13.233.117.88/
  //"http://3.108.252.90:4000/"
  static String ipAddress = "192.168.1.111";
  static String port = "4000";

  static get baseUrl {
    return buildType == AppBuild.dev
        ? "http://$ipAddress:$port/"
        : developmentUrl;
  }
}

class ApiConstants {
  static final baseUrl = BaseUrl.baseUrl;
  static final _user = "api/";
  static String refreshToken = "${_user}refreshtoken";
  static String login = "${_user}Login";
}
