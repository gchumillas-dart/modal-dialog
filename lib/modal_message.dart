part of modal_dialog;

class ModalMessage {
  final String _title;
  final String _message;

  ModalMessage(this._title, this._message) {
    DomElement md = $('<div class="modal" role="dialog" />')
      ..append((DomElement target) {
        target
          ..appendElement($('<div class="modal-dialog" />')
            ..append((DomElement target) {
              target
                ..appendElement($('<div class="modal-content" />')
                  ..appendElement($('<div class="modal-header" />')
                    ..appendElement($('<h3 />')..text = _title))
                  ..appendElement($('<div class="modal-body" />')
                    ..appendElement($('<p />')..text = _message))
                  ..appendElement($('<div class="modal-footer" />')
                    ..appendElement($('<button class="btn btn-default">')
                      ..data['dismiss'] = 'modal'
                      ..text = 'Close')
                    ..appendElement(
                        $('<button class="btn btn-primary">')..text = 'Save')));
            }));
      })
      ..appendTo(find('body'));

    Modal m = new Modal(md.nativeElement, keyboard: false, backdrop: 'static');
    m.toggle();
  }
}
