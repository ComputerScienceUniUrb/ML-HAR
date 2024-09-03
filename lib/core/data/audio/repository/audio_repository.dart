abstract class AudioRepository {
  Future playLoading();

  Future playStart();
  Future playPreStart();

  Future playStop();

  Future stop();
}
