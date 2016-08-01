// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_ar_001.dart' deferred as messages_ar_001;
import 'messages_de_DE.dart' deferred as messages_de_DE;
import 'messages_es_ES.dart' deferred as messages_es_ES;
import 'messages_fr_FR.dart' deferred as messages_fr_FR;
import 'messages_it_IT.dart' deferred as messages_it_IT;
import 'messages_ja_JP.dart' deferred as messages_ja_JP;
import 'messages_pt_PT.dart' deferred as messages_pt_PT;
import 'messages_ru_RU.dart' deferred as messages_ru_RU;
import 'messages_zh_Hans.dart' deferred as messages_zh_Hans;

Map<String, Function> _deferredLibraries = {
  'ar_001': () => messages_ar_001.loadLibrary(),
  'de_DE': () => messages_de_DE.loadLibrary(),
  'es_ES': () => messages_es_ES.loadLibrary(),
  'fr_FR': () => messages_fr_FR.loadLibrary(),
  'it_IT': () => messages_it_IT.loadLibrary(),
  'ja_JP': () => messages_ja_JP.loadLibrary(),
  'pt_PT': () => messages_pt_PT.loadLibrary(),
  'ru_RU': () => messages_ru_RU.loadLibrary(),
  'zh_Hans': () => messages_zh_Hans.loadLibrary(),
};

MessageLookupByLibrary _findExact(localeName) {
  switch (localeName) {
    case 'ar_001':
      return messages_ar_001.messages;
    case 'de_DE':
      return messages_de_DE.messages;
    case 'es_ES':
      return messages_es_ES.messages;
    case 'fr_FR':
      return messages_fr_FR.messages;
    case 'it_IT':
      return messages_it_IT.messages;
    case 'ja_JP':
      return messages_ja_JP.messages;
    case 'pt_PT':
      return messages_pt_PT.messages;
    case 'ru_RU':
      return messages_ru_RU.messages;
    case 'zh_Hans':
      return messages_zh_Hans.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future initializeMessages(String localeName) {
  var lib = _deferredLibraries[Intl.canonicalizedLocale(localeName)];
  var load = lib == null ? new Future.value(false) : lib();
  return load.then((_) {
    initializeInternalMessageLookup(() => new CompositeMessageLookup());
    messageLookup.addLocale(localeName, _findGeneratedMessagesFor);
  });
}

MessageLookupByLibrary _findGeneratedMessagesFor(locale) {
  var actualLocale = Intl.verifiedLocale(locale, (x) => _findExact(x) != null,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
