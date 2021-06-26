import 'dart:io';

String readJsonFromFile(String name) =>
    File('assets/raw/$name').readAsStringSync();
