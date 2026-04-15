import 'dart:io';

void main() {
  final dir = Directory('lib/core/models/legacy');
  final files = dir.listSync();
  
  for (var file in files) {
    if (file is File && file.path.endsWith('.dart')) {
      var content = file.readAsStringSync();
      // Replace legacy imports with relative imports or new package
      content = content.replaceAll('package:juna_flutter/models/', 'package:churo_mobile/core/models/legacy/');
      content = content.replaceAll('package:juna_flutter/system/app_setting.dart', '');
      file.writeAsStringSync(content);
    }
  }
}
