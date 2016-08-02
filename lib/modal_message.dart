part of modal_dialog;

/// A modal message.
///
/// It consists on a modal message with some buttons.
class ModalMessage extends ModalDialog {
  DomElement _target;
  Modal _modal;

  /// Creates a modal message dialog with a [title] and a [text].
  ///
  /// The text can be either plain-text or HTML, depending on the [html] flag.
  ModalMessage(String title, String text, {bool html, bool show: true}) {
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
                      if (html) {
                        target.addString(text);
                      } else {
                        target.addElement($('<p />')..text = text);
                      }
                    }))
                  ..addElement($('<div class="modal-footer" />')));
            }));
      })
      ..addTo(find('body'));

    // Creates a modal dialog and eventually shows it
    _modal =
        new Modal(_target.nativeElement, keyboard: false, backdrop: 'static');
    if (show) open();
  }

  /// Adds a button to the modal dialog.
  ///
  /// This function creates a button with a [title] and adds it to the footer
  /// of the modal dialog. The button can be any of the available bootstrap's
  /// button types: 'default', 'primary', etc...
  ///
  /// When the user presses the button, it calls the [action] callback. If this
  /// parameter is not present, the default action is closing the dialog.
  ///
  DomElement addButton(String title,
          {String type: 'default', _ActionCallback action: _defaultAction}) =>
      $('<button class="btn">')
        ..addClass('btn-${type}')
        ..text = title
        ..addTo(_target.find('.modal-footer'))
        ..on('click', () => action(this));

  @override
  Future<Modal> open() => new Future<Modal>.value(_modal..show());
}
