import 'dart:io';

void main() async {
  var resultRestoreDeps = await Process.run('flutter', ['pub', 'get']);
  print(resultRestoreDeps.stdout);

  var resultInstallHusky = await Process.run('dart', [
    'run',
    'husky',
    'install',
  ]);
  print(resultInstallHusky.stdout);

  var envFile = File('.env');
  var envFileExample = File('.env.example');
  if (!await envFile.exists()) {
    await envFileExample.copy('.env');
    print('CREATE A .ENV FILE PLEASE! https://github.com/Lacquer-UIT <- get env here.');
  }
}