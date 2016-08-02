// TODO: debería estar al mismo nivel que modal_dialog

import 'package:modal_dialog/core.dart' show ModalDialog;

void defaultAction(ModalDialog dialog) {
  dialog.close();
}

typedef void ActionCallback(ModalDialog dialog);
