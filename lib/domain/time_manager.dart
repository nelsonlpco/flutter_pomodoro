class TimeManager {
  late int _totalTimeInSeconds;

  TimeManager(int minutes, int seconds) {
    _totalTimeInSeconds = (minutes * 60 + seconds);
  }

  int get minutes => (_totalTimeInSeconds / 60).truncate();
  int get seconds => _totalTimeInSeconds % 60;
  String get formattedMinutes => minutes.toString().padLeft(2, "0");
  String get formattedSeconds => seconds.toString().padLeft(2, "0");
  int get totalTimeInSeconds => _totalTimeInSeconds;

  @override
  String toString() => "$formattedMinutes:$formattedSeconds";

  void increment(int seconds) {
    _totalTimeInSeconds++;
  }

  void drecrement(int seconds) {
    if (_totalTimeInSeconds > 0) _totalTimeInSeconds--;
  }
}
