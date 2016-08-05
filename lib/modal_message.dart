part of modal_dialog;

/// A modal message.
///
/// It consists on a modal message with some buttons.
class ModalMessage extends ModalDialog {
  static Map<String, String> _validSizes = <String, String>{
    'default': '',
    'small': 'modal-sm',
    'large': 'modal-lg'
  };
  static List<String> _validAlignments = <String>[
    'left',
    'center',
    'right',
    'justify'
  ];

  DomElement _target;
  Modal _modal;
  String _size = '';
  String _headerAlign = 'left';

  /// Creates a modal message dialog with a [title] and a [text].
  ///
  /// The text can be either plain-text or HTML, depending on the [html] flag.
  ModalMessage(String title, String text,
      {bool html, String align, String bodyAlign, String footerAlign}) {
    <String>[align, headerAlign, bodyAlign, footerAlign]
        .forEach((String align) {
      if (align != null && !_validAlignments.contains(align)) {
        throw new ArgumentError.value(align);
      }
    });

    _target = $('<div class="modal" role="dialog" />')
      ..add((DomElement target) {
        target
          ..addElement($('<div class="modal-dialog" />')
            ..add((DomElement target) {
              target
                ..addElement($('<div class="modal-content" />')
                  ..addElement($('<div class="modal-header" />')
                    ..addElement($('<h3 />')
                      ..css['text-align'] = headerAlign ?? align
                      ..text = title))
                  ..addElement($('<div class="modal-body" />')
                    ..css['text-align'] = bodyAlign ?? align
                    ..add((DomElement target) {
                      if (html) {
                        target.addString(text);
                      } else {
                        target.addElement($('<p />')..text = text);
                      }
                    }))
                  ..addElement($('<div class="modal-footer" />')
                    ..css['text-align'] = footerAlign ?? align
                    ..css['display'] = 'none'));
            }));
      })
      ..addTo(find('body'));

    // Creates a modal dialog and eventually shows it
    _modal =
        new Modal(_target.nativeElement, keyboard: false, backdrop: 'static');
  }

  Modal get modal => _modal;

  /// Header align ('left', 'center', 'right' or 'justify')
  String get headerAlign => _headerAlign;
  set headerAlign(String value) {
    _headerAlign = value;

    if (!_validAlignments.contains(value)) {
      throw new ArgumentError.value(value);
    }

    _target.find('.modal-header h3').css['text-align'] = value;
  }

  /// Modal dialog size ('default', 'small' or 'large').
  String get size => _size;
  set size(String value) {
    _size = value;

    if (!_validSizes.keys.contains(value)) {
      throw new ArgumentError.value(value);
    }

    DomElement modalDialog = _target.find('.modal-dialog');
    modalDialog..removeClass('modal-sm')..removeClass('modal-lg');
    if (value != 'default') {
      modalDialog.addClass(_validSizes[value]);
    }
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
        ..addTo(_target.find('.modal-footer')..css.remove('display'))
        ..on('click', () => action(this));

  @override
  Future<Null> open() async {
    _modal.show();
  }
}
