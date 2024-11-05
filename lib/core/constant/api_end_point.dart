abstract class APIEndPoint {
  static const url = "http://192.168.0.110:4000/api/v1/";
  static const imgBaseUrl = "http://192.168.0.110:4000/";
  static const login = "auth/login";
  static const singup = "auth/singup";
  static const personalPicture = "auth/personalPicture";
  static const refreshToken = "auth/refreshToken";
  static const sendVerificationCode = "auth/sendVerificationCode";
  static const verifyResetCode = "auth/verifyResetCode";
  static const resetPassword = "auth/resetPassword";
  static const profile = "profile";
  static const profileChangePersonalPicture = "profile/personalPicture";
  static const profileChangecoverPhoto = "profile/coverPhoto";
  static const posts = "posts";
  static const stories = "stories";
}
