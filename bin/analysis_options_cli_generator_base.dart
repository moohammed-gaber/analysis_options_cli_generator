#! /usr/bin/env dcli

// ignore: prefer_relative_imports
import 'package:analysis_options_cli_generator/src/analysis_options.dart';
import 'package:analysis_options_cli_generator/src/custom_analysis_options.dart';
import 'package:dcli/dcli.dart';

void main(List<String> args) {
  final result = menu(
    prompt: 'Select Mode',
    options: [
      'Sample "Use default rules"',
      'Custom "Choose y/n for only 4 rules"'
    ],
  );
  final bool isAvoidPrintEnabled,
      isSortPubEnabled,
      isSortConstructorsFirstEnabled,
      isPreferExpressionFunctionBodiesEnabled;
  final isCustomSelected = result == 'Custom';
  if (isCustomSelected) {
    isAvoidPrintEnabled = confirm('Avoid print', defaultValue: false);
    isSortPubEnabled = confirm('Sort pub dependencies', defaultValue: false);
    isSortConstructorsFirstEnabled =
        confirm('Sort constructors first', defaultValue: false);
    isPreferExpressionFunctionBodiesEnabled =
        confirm('Prefer expression function bodies', defaultValue: false);
  } else {
    isAvoidPrintEnabled = false;
    isSortPubEnabled = false;
    isSortConstructorsFirstEnabled = false;
    isPreferExpressionFunctionBodiesEnabled = false;
  }

  AnalysisOptions.fileName.write(AnalysisOptions.fileContent(
      CustomAnalysisOptions(
          isAvoidPrintEnabled,
          isSortPubEnabled,
          isSortConstructorsFirstEnabled,
          isPreferExpressionFunctionBodiesEnabled)));
}
