part of modal_dialog;

/// A modal message.
///
/// It consists on a modal message with some buttons.
class ModalMessage extends ModalDialog {
  static Map<String, String> _dialogSizes = <String, String>{
    'default': '',
    'small': 'modal-sm',
    'large': 'modal-lg'
  };
  static List<String> _validAlignments = <String>[
    '',
    'left',
    'center',
    'right',
    'justify'
  ];

  DomElement _target;
  Modal _modal;
  String _size = 'default';
  String _align = '';
  String _headerAlign = '';
  String _bodyAlign = '';
  String _footerAlign = '';

  /// Creates a modal message dialog with a [title] and a [text].
  ///
  /// The text can be either plain-text or HTML, depending on the [html] flag.
  ModalMessage(String title, String text, {bool html}) {
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
                  ..addElement($('<div class="modal-footer" />')
                    ..css['display'] = 'none'));
            }));
      })
      ..addTo(find('body'));

    _modal =
        new Modal(_target.nativeElement, keyboard: false, backdrop: 'static');
    _update();
  }

  /// General align ('left', 'center', 'right', 'justify' or empty string)
  ///
  /// Specifies the general align (header, body and footer).
  String get align => _align;
  set align(String value) {
    if (!_validAlignments.contains(value)) {
      throw new ArgumentError.value(value);
    }

    _align = value;
    _update();
  }

  /// Body align ('left', 'center', 'right', 'justify' or empty string)
  String get bodyAlign => _bodyAlign;
  set bodyAlign(String value) {
    if (!_validAlignments.contains(value)) {
      throw new ArgumentError.value(value);
    }

    _bodyAlign = value;
    _update();
  }

  // Footer align ('left', 'center', 'right', 'justify' or empty string)
  String get footerAlign => _footerAlign;
  set footerAlign(String value) {
    if (!_validAlignments.contains(value)) {
      throw new ArgumentError.value(value);
    }

    _footerAlign = value;
    _update();
  }

  /// Header align ('left', 'center', 'right', 'justify' or empty string)
  String get headerAlign => _headerAlign;
  set headerAlign(String value) {
    if (!_validAlignments.contains(value)) {
      throw new ArgumentError.value(value);
    }

    _headerAlign = value;
    _update();
  }

  Modal get modal => _modal;

  /// Modal dialog size ('default', 'small' or 'large').
  String get size => _size;
  set size(String value) {
    if (!_dialogSizes.keys.contains(value)) {
      throw new ArgumentError.value(value);
    }

    _size = value;
    _update();
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

  void _update() {
    DomElement modalDialog = _target.find('.modal-dialog');
    modalDialog..removeClass('modal-sm')..removeClass('modal-lg');
    if (_size != 'default') {
      modalDialog.addClass(_dialogSizes[_size]);
    }

    DomElement h3 = _target.find('.modal-header h3');
    h3.css['text-align'] = _headerAlign.isEmpty ? _align : _headerAlign;

    DomElement body = _target.find('.modal-body');
    body.css['text-align'] = _bodyAlign.isEmpty ? _align : _bodyAlign;

    DomElement footer = _target.find('.modal-footer');
    footer.css['text-align'] = _footerAlign.isEmpty ? _align : _footerAlign;
  }
}
