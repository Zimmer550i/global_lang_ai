import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  TtsService._();
  static final TtsService instance = TtsService._();

  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;

  /// Holds the text that is currently being spoken, or null if idle/stopped.
  final ValueNotifier<String?> currentlySpeaking = ValueNotifier<String?>(null);

  /// Initializes the TTS engine with proper audio session settings for iOS and Android.
  Future<void> init() async {
    if (_isInitialized) return;

    try {
      if (!kIsWeb && Platform.isIOS) {
        // Prevent iOS from shutting down audio session after first utterance
        await _flutterTts.autoStopSharedSession(false);

        // Set playback category so it speaks through the main speaker and ignores silent switch
        await _flutterTts.setIosAudioCategory(
          IosTextToSpeechAudioCategory.playback,
          [
            IosTextToSpeechAudioCategoryOptions.defaultToSpeaker,
            IosTextToSpeechAudioCategoryOptions.allowBluetooth,
            IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
            IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          ],
          IosTextToSpeechAudioMode.defaultMode,
        );

        // Activate audio session
        await _flutterTts.setSharedInstance(true);
      }

      // We rely on event handlers instead of awaitSpeakCompletion to prevent
      // hanging on simulators or when speech is cancelled/interrupted.
      await _flutterTts.awaitSpeakCompletion(false);

      _flutterTts.setStartHandler(() {
        // Speech started
      });

      _flutterTts.setCompletionHandler(() {
        currentlySpeaking.value = null;
      });

      _flutterTts.setCancelHandler(() {
        currentlySpeaking.value = null;
      });

      _flutterTts.setErrorHandler((dynamic msg) {
        debugPrint("TTS Error: $msg");
        currentlySpeaking.value = null;
      });

      _isInitialized = true;
    } catch (e) {
      debugPrint("Error initializing TTS: $e");
    }
  }

  /// Speaks the provided [text].
  /// If [text] is currently speaking, calling this toggles it off (stops playback).
  /// If another text is currently speaking, it will be stopped before speaking [text].
  Future<void> speak(
    String text, {
    String language = 'en-US',
    double speechRate = 0.5,
    double volume = 1.0,
    double pitch = 1.0,
  }) async {
    final cleanText = text.trim();
    if (cleanText.isEmpty) return;

    await init();

    // Toggle off if already speaking the exact same text
    if (currentlySpeaking.value == cleanText) {
      await stop();
      return;
    }

    // Stop any existing speech before starting new one
    await stop();

    // Reactivate audio session on iOS before speaking
    if (!kIsWeb && Platform.isIOS) {
      try {
        await _flutterTts.setSharedInstance(true);
      } catch (e) {
        debugPrint("TTS setSharedInstance error: $e");
      }
    }

    currentlySpeaking.value = cleanText;

    try {
      await _flutterTts.setLanguage(language);
      await _flutterTts.setSpeechRate(speechRate);
      await _flutterTts.setVolume(volume);
      await _flutterTts.setPitch(pitch);

      final result = await _flutterTts.speak(cleanText);
      if (result != 1 && currentlySpeaking.value == cleanText) {
        // If speaking failed to start
        currentlySpeaking.value = null;
      }
    } catch (e) {
      debugPrint("TTS speak exception: $e");
      if (currentlySpeaking.value == cleanText) {
        currentlySpeaking.value = null;
      }
    }
  }

  /// Stops TTS playback.
  Future<void> stop() async {
    try {
      await _flutterTts.stop();
    } catch (e) {
      debugPrint("TTS stop exception: $e");
    } finally {
      currentlySpeaking.value = null;
    }
  }

  /// Checks if [text] is currently being spoken.
  bool isSpeaking(String text) => currentlySpeaking.value == text;
}
