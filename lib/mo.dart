import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
const TAG="\$";
const SRC="./json";
const DIST="lib/models";

void walk() {
  var src = new Directory(SRC);
  var list = src.listSync();
  var template = new File("./template.dart").readAsStringSync();
  File file;
  list.forEach((f) {
      if(FileSystemEntity.isFileSync(f.path)) {
        file = new File(f.path);
        var paths = path.basename(f.path).split(".");
        String name = paths.first;
        if (paths.last.toLowerCase()!="json" || name.startsWith("_")) return;
        if(name.startsWith("_")) return;
        var map = json.decode(file.readAsStringSync());
        var set = new Set<String>();
        StringBuffer attrs = new StringBuffer();
        (map as Map<String, dynamic>).forEach((key, value) {
          if (key.startsWith("_")) return;
          attrs.write(getType(value, set, name));
          attrs.write("");
          attrs.write(key);
          attrs.writeln(";");
          attrs.write("    ");
        });
        String className = name[0].toUpperCase() + name.substring(1);
        var dist = format(template, [name, className, className, attrs.toString(), className, className, className]);
        var _import = set.join(";\r\n");
        _import += _import.isEmpty?"":";";
        dist = dist.replaceFirst("%t", _import);
        new File("$DIST$name.dart").writeAsStringSync(dist);
      }
  });
}

String changeFirstChar(String str, [bool upper=true]) {
  return (upper?str[0].toUpperCase():str[0].toLowerCase()) + str.substring(1);
}

String getType(v, Set<String> set, String current) {
  current = current.toLowerCase();
  if (v is bool) {
    return "bool";
  } else if (v is num) {
    return "num";
  } else if (v is Map) {
    return "Map<String, dynamic>";
  } else if (v is List) {
    return "List";
  } else if (v is String) {
    if (v.startsWith("$TAG[]")) {
      var className = changeFirstChar(v.substring(3), false);
      if (className.toLowerCase()!=current) {
        set.add('import "$className.dart"');
      }
      return "List<${changeFirstChar(className)}>";
    } else if (v.startsWith(TAG)) {
      var fileName = changeFirstChar(v.substring(1), false);
      if (fileName.toLowerCase()!=current) {
        set.add('import "$fileName.dart"');
      }
      return changeFirstChar(fileName);
    }
    return "String";
  } else {
    return "String";
  }
}

String format(String fmt, List<Object> params) {
  int matchIndex = 0;
  String replace(Match m) {
    if (matchIndex < params.length) {
      switch (m[0]) {
        case "%s":
            return params[matchIndex++].toString();
      }
    } else {
      throw new Exception("Missing parameter for string format");
    }
    throw new Exception("Invalid format string: " + m[0].toString());
  }
  return fmt.replaceAllMapped("%s", replace);
}

void main() {
  walk();
}