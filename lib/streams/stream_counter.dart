
import 'dart:async';

class StreamCounter{
  int count = 0;
  StreamController<int> _controller = StreamController();

  Stream<int> stream(){
    return _controller.stream;
  }

  void add(){
    count++;
    _controller.sink.add(count);
  }

  void remove(){
    count--;
    _controller.sink.add(count);
  }


}