import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/services/tts_service.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';

class TtsWidget extends StatefulWidget {
  final String text;
  final String? language;
  final double? size;
  final Color? color;
  final Color? activeColor;
  final EdgeInsetsGeometry? padding;
  final double speechRate;
  final double volume;
  final double pitch;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const TtsWidget({
    super.key,
    required this.text,
    this.language,
    this.size,
    this.color,
    this.activeColor,
    this.padding,
    this.speechRate = 0.5,
    this.volume = 1.0,
    this.pitch = 1.0,
    this.onStart,
    this.onComplete,
  });

  @override
  State<TtsWidget> createState() => _TtsWidgetState();
}

class _TtsWidgetState extends State<TtsWidget> {
  @override
  void initState() {
    super.initState();
    TtsService.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: TtsService.instance.currentlySpeaking,
      builder: (context, speakingText, _) {
        final isPlaying = speakingText == widget.text;

        return Semantics(
          button: true,
          label: "Pronounce ${widget.text}",
          child: Tooltip(
            message: "Listen",
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () async {
                if (isPlaying) {
                  await TtsService.instance.stop();
                } else {
                  widget.onStart?.call();
                  await TtsService.instance.speak(
                    widget.text,
                    language: widget.language ?? "en-US",
                    speechRate: widget.speechRate,
                    volume: widget.volume,
                    pitch: widget.pitch,
                  );
                  widget.onComplete?.call();
                }
              },
              child: Padding(
                padding: widget.padding ?? const EdgeInsets.all(4.0),
                child: CustomSvg(
                  asset: "assets/icons/speaker.svg",
                  size: widget.size ?? 24.0,
                  color: isPlaying
                      ? (widget.activeColor ?? AppColors.primary)
                      : (widget.color ?? AppColors.black.shade400),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
