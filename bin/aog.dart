#! /usr/bin/env dcli

// ignore: prefer_relative_imports
import 'dart:io';
import 'package:analysis_options_cli_generator/src/flutter_lints_pub_client.dart';
import 'package:analysis_options_cli_generator/src/pubspec.dart';
import 'package:plain_optional/plain_optional.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pubspec_yaml/pubspec_yaml.dart';

import 'package:analysis_options_cli_generator/src/analysis_options.dart';
import 'package:analysis_options_cli_generator/src/custom_analysis_options.dart';
import 'package:dcli/dcli.dart';
import 'package:yaml/yaml.dart';

//Avoid defining a class that contains only static members
void main(List<String> args) async {
  const custom = 'Custom "Choose y/n for only 4 rules"';
  final result = menu(
    prompt: 'Select Mode',
    options: ['Basic "Use default rules"', custom],
  );
  final bool isAvoidPrintEnabled,
      isSortPubEnabled,
      isSortConstructorsFirstEnabled,
      isPreferExpressionFunctionBodiesEnabled;
  final isCustomSelected = result == custom;
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

  await Pubspec.updateFile();
}
/*
  final loadedYaml = loadYaml(readYamlFile);
  final YamlMap devDependencies = loadedYaml['dev_dependencies'];

  devDependencies.addAll(
      {'flutter_lints': Dependency.fromHosted('flutter_lints', '^1.0.0')});
  if (!devDependencies.containsKey('flutter_lints')) {
    print('heloo');
  }

 */
