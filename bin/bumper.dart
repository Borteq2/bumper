import 'dart:io';
import 'package:cli_menu/cli_menu.dart';

void main(List<String> args) {
  const red = '\x1B[31m'; // red for major version
  const orange = '\x1B[33m'; // orange for minor version
  const green = '\x1B[32m'; // green for patch version
  const reset = '\x1B[0m'; // reset color

  String? type = args.isEmpty ? null : args[0];
  type ??= _getVersionTypeFromUser();

  final pubspec = File('pubspec.yaml');
  if (!pubspec.existsSync()) {
    stdout.writeln('pubspec.yaml not found.');
    return;
  }

  final lines = pubspec.readAsLinesSync();
  final versionLine = lines.firstWhere((line) => line.startsWith('version:'));
  final versionParts = RegExp(r'(\d+)\.(\d+)\.(\d+)\+(\d+)')
      .firstMatch(versionLine)!
      .groups([1, 2, 3, 4])
      .map((e) => int.parse(e!))
      .toList();

  int major = versionParts[0];
  int minor = versionParts[1];
  int patch = versionParts[2];
  int build = versionParts[3];

  if (type == 'major') {
    major++;
    minor = 0;
    patch = 0;
  } else if (type == 'minor') {
    minor++;
    patch = 0;
  } else if (type == 'patch') {
    patch++;
  } else if (type == 'build') {
    build++;
  } else {
    stdout.writeln('Wrong type: $type');
    return;
  }

  final newVersion = 'version: $major.$minor.$patch+$build';
  final updatedLines = lines.map((line) {
    if (line.startsWith('version:')) return newVersion;
    return line;
  }).toList();

  pubspec.writeAsStringSync(updatedLines.join('\n'));

  stdout.writeln('Bumped to: '
      '$red$major$reset.'
      '$orange$minor$reset.'
      '$green$patch$reset+'
      '$build');
}

String _getVersionTypeFromUser() {
  final menu = Menu(['major', 'minor', 'patch', 'build']);
  final result = menu.choose();

  return result.value;
}
