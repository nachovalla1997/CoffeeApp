// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_to_favorite":
            MessageLookupByLibrary.simpleMessage("Add to Favorites"),
        "error_message":
            MessageLookupByLibrary.simpleMessage("Oops! Something went wrong."),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorites"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "home_screen_title": MessageLookupByLibrary.simpleMessage("Coffee App"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "try_again": MessageLookupByLibrary.simpleMessage("Please try again."),
        "zoom": MessageLookupByLibrary.simpleMessage("Zoom")
      };
}
