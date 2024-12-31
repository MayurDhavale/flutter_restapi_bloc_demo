import 'dart:async';

enum CounterAction { Increment, Decrement, Reset }

class CounterBloc {
  int counter=0;
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get countersink => _stateStreamController.sink;
  Stream<int> get counterstream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventsink => _eventStreamController.sink;
  Stream<CounterAction> get eventstream => _eventStreamController.stream;

  CounterBloc() {
  
    eventstream.listen((event) {
      if (event == CounterAction.Increment){
          counter++;
      }
        
      else if (event == CounterAction.Decrement){
          counter--;
      }
       
      else if (event == CounterAction.Reset){
          counter = 0;
      } 

      countersink.add(counter);
    });
  }
}
