class CustomAnalysisOptions {
  final bool isAvoidPrintEnabled;
  final bool isSortPubEnabled;
  final bool isSortConstructorsFirstEnabled;
  final bool isPreferExpressionFunctionBodiesEnabled;

  CustomAnalysisOptions(
      this.isAvoidPrintEnabled,
      this.isSortPubEnabled,
      this.isSortConstructorsFirstEnabled,
      this.isPreferExpressionFunctionBodiesEnabled);

  String get toAnalysisOptionsFormat {
    return '''
avoid_print: $isAvoidPrintEnabled
    sort_pub_dependencies: $isSortPubEnabled
    sort_constructors_first: $isSortConstructorsFirstEnabled
    prefer_expression_function_bodies: $isPreferExpressionFunctionBodiesEnabled
        ''';
  }
}
