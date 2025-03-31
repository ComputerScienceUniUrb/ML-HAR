import 'package:aifit/core/data/audio/repository/audio_repository.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_repository_impl.g.dart';

@Riverpod(keepAlive: true)
AudioRepository getAudioRepository(GetAudioRepositoryRef ref) {
  final repo = AudioRepositoryImpl();
  ref.onDispose(repo.dispose);
  return repo;
}

class AudioRepositoryImpl implements AudioRepository {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioRepositoryImpl();

  @override
  playLoading() async {
    try {
      await _audioPlayer
          .setAudioSource(AudioSource.asset('assets/sounds/finish_bigdsc.mp3'));
      await _audioPlayer.play();
    } catch (ex, st) {
      _log(ex, st);
    }
  }

  @override
  playStart() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer
          .setAudioSource(AudioSource.asset('assets/sounds/start_work.mp3'));
      await _audioPlayer.play();
    } catch (ex, st) {
      _log(ex, st);
    }
  }

  @override
  playPreStart() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer
          .setAudioSource(AudioSource.asset('assets/sounds/pre_start.mp3'));
      await _audioPlayer.play();
    } catch (ex, st) {
      _log(ex, st);
    }
  }

  @override
  playStop() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer
          .setAudioSource(AudioSource.asset('assets/sounds/complete.mp3'));
      await _audioPlayer.play();
    } catch (ex, st) {
      _log(ex, st);
    }
  }

  @override
  stop() async {
    try {
      await _audioPlayer.stop();
    } catch (ex, st) {
      _log(ex, st);
    }
  }

  @override
  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }

  /// Log error
  _log(Object error, StackTrace stackTrace) {
    logger.e('AudioRepository:', error: error, stackTrace: stackTrace);
  }
}
