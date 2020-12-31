import 'dart:isolate';

void main() async {
  // 1
  final receivePort = ReceivePort();
  // 2
  final isolate = await Isolate.spawn(
    downloadAndCompressTheInternet,
    receivePort.sendPort,
  );
  // 3
  receivePort.listen((message) {
    print(message);
    receivePort.close();
    isolate.kill();
  });
}

// 4
void downloadAndCompressTheInternet(SendPort sendPort) {
  sendPort.send(42);
}
