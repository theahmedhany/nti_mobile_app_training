void main() {
  // Hello.

  Service service = Service();
  service.start();
}

mixin Logger {
  void log(String message) {
    print('Log: $message');
  }
}

class Service with Logger {
  void start() {
    log('Service started');
  }
}
