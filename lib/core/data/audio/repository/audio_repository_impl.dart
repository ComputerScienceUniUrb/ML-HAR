import 'package:aifit/core/data/audio/repository/audio_repository.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_repository_impl.g.dart';

@Riverpod(keepAlive: true)
AudioRepository getAudioRepository(GetAudioRepositoryRef ref) {
  return AudioRepositoryImpl();
}

class AudioRepositoryImpl implements AudioRepository {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioRepositoryImpl() {
    // _audioPlayer
    //     .setAudioSource(AudioSource.asset('assets/sounds/finish_bigdsc.mp3'));
  }

  @override
  playLoading() async {
    await _audioPlayer
        .setAudioSource(AudioSource.asset('assets/sounds/finish_bigdsc.mp3'));
    await _audioPlayer.play();
  }

  @override
  playStart() async {
    await _audioPlayer.stop();
    await _audioPlayer
        .setAudioSource(AudioSource.asset('assets/sounds/start_work.mp3'));
    await _audioPlayer.play();
  }

  @override
  playPreStart() async {
    await _audioPlayer.stop();
    await _audioPlayer
        .setAudioSource(AudioSource.asset('assets/sounds/pre_start.mp3'));
    await _audioPlayer.play();
  }

  @override
  playStop() async {
    await _audioPlayer.stop();
    await _audioPlayer
        .setAudioSource(AudioSource.asset('assets/sounds/complete.mp3'));
    await _audioPlayer.play();
  }

  @override
  stop() async {
    await _audioPlayer.stop();
  }
}
