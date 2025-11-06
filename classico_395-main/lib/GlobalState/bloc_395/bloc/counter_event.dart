abstract class CounterEvent{}

class IncrementCountEvent extends CounterEvent{
  int count;
  IncrementCountEvent({this.count = 1});
}
class DecrementCountEvent extends CounterEvent{}