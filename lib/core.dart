/// A Modal Dialog System based on the Bootstrap framework.
///
/// This library provides a set of modal dialogs based on the Bootstrap
/// framework.
///
library modal_dialog;

import 'dart:async';

import 'package:bootjack/bootjack.dart';
import 'package:domelement/core.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

import 'src/intl/locale/messages_all.dart';
import 'src/intl/messages.dart';

part 'modal_alert.dart';
part 'modal_confirm.dart';
part 'modal_dialog.dart';
part 'modal_loading.dart';
part 'modal_message.dart';

/// This is the default action for all buttons.
///
/// By default when the user presses a button the modal dialog is closed
/// unless otherwise specified.
void _defaultAction(ModalDialog dialog) {
  dialog.close();
}

/// Gets the locale based on the [locale] parameter.
///
/// If the [locate] parameter is empty, this function takes
/// Intl.defaultLocale. And if it is empty too, it takes the system locale.
Future<String> _getLocale(String locale) async {
  String ret;
  Stream<String> locales = new Stream<String>.fromFutures(<Future<String>>[
    new Future<String>.value(locale),
    new Future<String>.value(Intl.defaultLocale),
    findSystemLocale()
  ]);
  await for (String locale in locales) {
    if (locale != null && locale.length > 0) {
      ret = locale;
      break;
    }
  }
  return ret;
}

/// This is the action tied to any button.
///
/// For example:
///
///     new ModalConfirm(
///       'Delete record',
///       'Are you sure',
///       (ModalDialog dialog) {
///         print('ok');
///         dialog.close();
///       }
///     );
typedef void _ActionCallback(ModalDialog dialog);
