import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:roggle/roggle.dart';

class LoggerUtil {
  static final logger = kReleaseMode
      ? Roggle.crashlytics(
          printer: CrashlyticsPrinter(
            errorLevel: Level.error, // Logs above this level will call onError
            onError: (event) {
              // Send an error to Firebase Crashlytics as follows
              FirebaseCrashlytics.instance.recordError(
                event.exception,
                event.stack,
                fatal: true,
              );
            },
            onLog: (event) {
              // Send logs to Firebase Crashlytics as follows
              FirebaseCrashlytics.instance.log(event.message);
            },
            loggerName: 'Roggle',
            levelEmojis: {}, // Replace level emojis map
            levelLabels: {}, // Replace level labels map
          ),
        )
      : Roggle();
}
