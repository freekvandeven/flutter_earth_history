// store all the application configs like language and theme
import 'package:flutter/material.dart';

@immutable
class ApplicationConfiguration {
  const ApplicationConfiguration({
    required this.language,
    required this.introductionFinished,
  });

  factory ApplicationConfiguration.defaultConfiguration() =>
      const ApplicationConfiguration(
        language: 'default',
        introductionFinished: false,
      );

  factory ApplicationConfiguration.fromJson(Map<String, dynamic> json) =>
      ApplicationConfiguration(
        language: json['language'] as String,
        introductionFinished: json['introductionFinished'] as bool,
      );

  final String language;
  final bool introductionFinished;

  Map<String, dynamic> toJson() => {
        'language': language,
        'introductionFinished': introductionFinished,
      };

  ApplicationConfiguration copyWith({
    String? language,
    bool? introductionFinished,
  }) =>
      ApplicationConfiguration(
        language: language ?? this.language,
        introductionFinished: introductionFinished ?? this.introductionFinished,
      );
}
