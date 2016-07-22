part of modal_dialog;

class ModalMessage extends ModalDialog {
  DomElement _modalElement;
  Modal _modal;

  ModalMessage(String title, {String text}) {
    _modalElement = $('<div class="modal" role="dialog" />')
      ..append((DomElement target) {
        target
          ..appendElement($('<div class="modal-dialog" />')
            ..append((DomElement target) {
              target
                ..appendElement($('<div class="modal-content" />')
                  ..appendElement($('<div class="modal-header" />')
                    ..appendElement($('<h3 />')..text = title))
                  ..appendElement($('<div class="modal-body" />')
                    ..appendElement($('<p />')..text = text))
                  ..appendElement($('<div class="modal-footer" />')));
            }));
      })
      ..appendTo(find('body'));

    _modal = new Modal(_modalElement.nativeElement,
        keyboard: false, backdrop: 'static');
    _modal.show();
  }

  DomElement addButton(String title, {String type: 'default'}) {
    return $('<button class="btn">')
      ..addClass('btn-${type}')
      ..text = title
      ..appendTo(_modalElement.find('.modal-footer'));
  }

  void close() {
    _modal.hide();
    _modalElement.remove();
  }
}
