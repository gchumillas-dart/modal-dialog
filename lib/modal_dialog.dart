part of modal_dialog;

void defaultAction(ModalDialog dialog) => dialog.close();

typedef void Callback(ModalDialog dialog);

abstract class ModalDialog {
  Modal get modal;

  void close() {
    modal.hide();
    modal.element.remove();
  }
}
