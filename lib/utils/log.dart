import 'dart:developer' show log;
import 'dart:math' show min, max;

enum LogLevel {
  INFO,
  WARN,
  ERROR,
}

Map<LogLevel, String> levelPrefixes = {
  LogLevel.INFO: "👻",
  LogLevel.WARN: "⚠️",
  LogLevel.ERROR: "😡",
};

int clamp(int val, int minNum, int maxNum) {
  int _minNum = min(minNum, maxNum);
  int _maxNum = max(minNum, maxNum);
  return max(_minNum, min(val, _maxNum));
}

void tLog(
  String message, {
  int stackStart = 1,
  int stackEnd = 2,
  LogLevel logLevel = LogLevel.INFO,
}) {
  assert(stackStart >= 1);
  assert(stackEnd > stackStart);
  List<String> stackList = StackTrace.current.toString().split("\n");
  int stackLen = stackList.length;
  int tarStackStart = clamp(stackStart, 1, stackLen - 1);
  int tarStackEnd = clamp(stackEnd, tarStackStart, stackLen);
  String stackStr = stackList.sublist(tarStackStart, tarStackEnd).join("\n");
  StackTrace stackTrace = StackTrace.fromString(stackStr);
  log("${levelPrefixes[logLevel]} $message");
  print("${levelPrefixes[logLevel]} stack:");
  print(stackTrace);
}

void _logSomething(String message,
    {int stackDepth = 1, LogLevel logLevel = LogLevel.INFO}) {
  assert(stackDepth >= 1);
  int stackStart = 3;
  int stackEnd = stackStart + stackDepth;
  tLog(message, stackStart: stackStart, stackEnd: stackEnd, logLevel: logLevel);
}

void logInfo(String message, {int stackDepth = 3}) {
  _logSomething(message, stackDepth: stackDepth, logLevel: LogLevel.INFO);
}

void logWarn(String message, {int stackDepth = 3}) {
  _logSomething(message, stackDepth: stackDepth, logLevel: LogLevel.WARN);
}

void logError(String message, {int stackDepth = 3}) {
  _logSomething(message, stackDepth: stackDepth, logLevel: LogLevel.ERROR);
}
