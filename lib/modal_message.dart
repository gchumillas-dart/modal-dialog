part of modal_dialog;

class ModalMessage extends ModalDialog {
  DomElement _target;
  Modal _modal;

  ModalMessage(String title, {String text, String html}) {
    if (text == null && html == null) {
      throw new ArgumentError.notNull('text or html');
    }

    _target = $('<div class="modal" role="dialog" />')
      ..add((DomElement target) {
        target
          ..addElement($('<div class="modal-dialog" />')
            ..add((DomElement target) {
              target
                ..addElement($('<div class="modal-content" />')
                  ..addElement($('<div class="modal-header" />')
                    ..addElement($('<h3 />')..text = title))
                  ..addElement($('<div class="modal-body" />')
                    ..add((DomElement target) {
                      if (text != null) {
                        target.addElement($('<p />')..text = text);
                      } else {
                        target.addString(html);
                      }
                    }))
                  ..addElement($('<div class="modal-footer" />')));
            }));
      })
      ..addTo(find('body'));

    _modal =
        new Modal(_target.nativeElement, keyboard: false, backdrop: 'static');
    _modal.show();
  }

  Modal get modal => _modal;

  DomElement addButton(String title,
      {String type: 'default', Callback action}) {
    DomElement button = $('<button class="btn">')
      ..addClass('btn-${type}')
      ..text = title
      ..addTo(_target.find('.modal-footer'))
      ..on('click', () {
        if (action != null) {
          action(this);
        }
      });
    return button;
  }
}
