import 'dart:io';
import 'dart:convert';

void main() async {
  // Run code analysis with dart analyze
  final processResult = await Process.run(
    'dart',
    ['analyze', '--format=json', 'lib'], // Analyze the 'lib' directory
  );

  // Check if the analysis command failed
  if (processResult.exitCode != 0 && processResult.stderr.isNotEmpty) {
    stderr.writeln("❌ Code analysis failed:\n${processResult.stderr}");
    exit(processResult.exitCode);
  }

  // Read the analysis output from stdout
  final output = processResult.stdout as String;

  // Decode the JSON output from dart analyze
  final Map<String, dynamic> report = json.decode(output);

  // Get the list of issues from the report
  final List<dynamic> issues = report['issues'] ?? [];

  // Categorize issues by severity
  final errors = <String>[];
  final warnings = <String>[];
  final infos = <String>[];

  for (final issue in issues) {
    final String severity = issue['severity']; // error, warning, info
    final String message = issue['message'];
    final String file = issue['location']['file'];
    final int line = issue['location']['range']['start']['line'];
    final int column = issue['location']['range']['start']['column'];

    final formattedIssue = '[$severity] $message (at $file:$line:$column)';

    // Group issues by severity
    if (severity == 'error') {
      errors.add(formattedIssue);
    } else if (severity == 'warning') {
      warnings.add(formattedIssue);
    } else {
      infos.add(formattedIssue);
    }
  }

  // Summary report
  final totalErrors = errors.length;
  final totalWarnings = warnings.length;
  final totalInfos = infos.length;

  final buffer = StringBuffer();

  if (issues.isNotEmpty) {
    buffer.writeln("\n🔍 **Code Analysis Report** 🔍");

    if (totalErrors > 0) {
      buffer.writeln("\n❌ **Critical Errors (${totalErrors})**:");
      errors.forEach(buffer.writeln);
    }
    if (totalWarnings > 0) {
      buffer.writeln("\n⚠️ **Warnings (${totalWarnings})**:");
      warnings.forEach(buffer.writeln);
    }
    if (totalInfos > 0) {
      buffer.writeln("\nℹ️ **Info (${totalInfos})**:");
      infos.forEach(buffer.writeln);
    }

    buffer.writeln(
        "\nSummary: ${totalErrors} errors, ${totalWarnings} warnings, ${totalInfos} info.");
  } else {
    buffer.writeln("✅ Code analysis completed successfully. No issues found.");
  }

  // Generate timestamped file name
  final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
  final reportFileName = 'analysis_report_$timestamp.txt';

  // Write the report to a file
  final reportFile = File(reportFileName);
  await reportFile.writeAsString(buffer.toString());
  stdout.writeln("📄 The report has been saved to: ${reportFile.path}");

  // Print the report to the console
  stdout.writeln(buffer.toString());

  // Exit with appropriate code based on the severity
  if (totalErrors > 0) {
    exit(1); // Fail if there are critical errors
  } else if (totalWarnings > 0) {
    exit(0); // Success, but with warnings
  } else {
    exit(0); // Success
  }
}
