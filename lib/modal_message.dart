part of modal_dialog;

// TODO: target getter
class ModalMessage extends ModalDialog {
  DomElement _modalElement;
  Modal _modal;

  ModalMessage(String title, {String text, String html}) {
    if (text == null && html == null) {
      throw new ArgumentError.notNull('text or html');
    }

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
                    ..append((DomElement target) {
                      if (text != null) {
                        target.appendElement($('<p />')..text = text);
                      } else {
                        target.appendString(html);
                      }
                    }))
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
