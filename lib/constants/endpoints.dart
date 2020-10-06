class Endpoints {
  static String baseUrl = "https://olx-app-jiji.herokuapp.com";
  static String registerUser = "$baseUrl/api/register";
  static String checkUserCredentials = "$baseUrl/api/login";
  static String categories = "$baseUrl/api/categories";
  static String subCategories = "$baseUrl/api/sub/categories";
  static String popularProducts = "$baseUrl/api/posts/mostview";
  static String similarProducts = "$baseUrl/api/sub/category";
  static String getUserProfile = "$baseUrl/api/user";
  static String updateUser = "$baseUrl/api/user";
}
