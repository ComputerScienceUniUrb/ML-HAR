abstract class UserRepository{
  Future<double?> getUserHeight();

  Future<void> setUserHeight(int height);
}