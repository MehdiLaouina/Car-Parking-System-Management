class Config {
  static const String appName = "Park My Car";
  static const String apiURL = "10.15.71.12:3000";

  static const String map = "/map";

  static const String loginClientAPI = "/loginClient";
  static const String registerClientAPI = "/signupClient";
  static const String loginAdminAPI = "/loginAdmin";
  static const String registerAdminAPI = "/dev/createAdmin";

  static const String clientProfileAPI = "/client/userprofile";
  static const String adminProfileAPI = "/admin/userprofile";

  static const String adminOwning = "/getParkings";
  static const String clientReservations = "/getReservations";

  static const String clientLogOut = "/client/logout";
  static const String adminLogOut = "/admin/logout";
}
