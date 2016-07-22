part of modal_dialog;

// TODO: image property
class ModalLoading extends ModalDialog {
  String _loadingImage = 'data:image/gif;base64,' +
      'R0lGODlhNgA2AKUAAESKzKTG5NTi9HSq1OTy/GSi1LzW7JS65FSWzPT2/KzO7Nzq9ISy3' +
      'MTe7JzC5EySzHSm1Pz+/EyOzKzK5Nzm9Hyu3Ozy/Gyi1Jy+5Fye1Pz6/LTO7Mze9ESOzK' +
      'TK5NTm9HSq3MTa7JS+5Fya1PT6/OTu9Iy23JzG5Oz2/Gym1LTS7Mzi9P///wAAAAAAAAA' +
      'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/' +
      'C05FVFNDQVBFMi4wAwEAAAAh+QQICQAAACwAAAAANgA2AAAG/kCWcEgsGoURlKXETESO0' +
      'Kh0SlqWFsyShTTteo+kLBOLLXG/6GnEWs5iLc+0N0KPE8PXcT57JtbtaBEJFgQWW3ZrYm' +
      '17KIhVSxZOXxFVe0woGkhLi5xwQhpWYgQkgFB4blmeiXllZEyqbJZmaqh6WI0sKGK7WSg' +
      'siZxipUUJirwlmRoErMwLWyzKtXolCVHAqK7Uv7rHl0/Fu4taw0jLsorVv7FkhXHF2c0E' +
      '5L/GrmW+SINikXbc07uejlw7hqXPJxIoEiQwyAJcG3vjopyCyIRApkDmzjWRsircRjnvs' +
      'F0JGCUas1fzOIZaZOGimlCvSMkZQglmCVyTNCRIKGlm/hGdShJoSOmHjk+fdaBEKPFhhY' +
      'AFPY9y1GkIhUyaKBoY2MqVAtGjgjK+cmmBq4ENZle4lOpnpZtnJEJsRTvXgAoDC9gaCSn' +
      'NIgWzZwGHYCjVpKU2KOTepRuYbgm9Q/C0MlaCK13GgfNCbsgLXmXAdblqhpyAYi25aFPX' +
      'Rft48ylbu/6CNjt4M7Rl4lwtDLG4cWAKtoWAO1nxCQG5szmshdyx1pk1qAMboLB8c5JaJ' +
      'D8x5SCAQtTgSDQosZBwXlLw1ox2WSMgRAPvetcYcIBBwYLqURKocGBChP8THHxljQcIdA' +
      'CAgRJUYIEXKATgn3/9HSCCAQIaoYEJAGSYoYEd/mQwmikTHNBffxD6F2AaEXiw4YEaZng' +
      'BYUR88OCDJIpgQgDpfGFBgS1yyKIK1mwggoQ11ijCB8SssBUHOQphwIoGtnhgCuY5YCON' +
      'WJrQQGQqDHBBARdcAIIKfWAQJZQsAoBAlViW+GAIQpCAQQphXpACmCmIcIYIK0rJ4gPmT' +
      'WBkkTYK8EsAX9KJZ50ePDGBhj6e2WFKDQx5pZv+LVhCCnQm+uWnIOS1QAdnQqqhCFJYwF' +
      '+bV6rwxAaedkqnohv8UgGLPv754REyXnppAL5EIEKnYBZwp6ciPFFCBlJG2YECX0XwgZW' +
      '+ToBPBCbcOWuYnX6ZrBALFJDrga5+kZUHWA6csMEHfUSAaJjFHmvsBSfYQYIKKSDwQAYn' +
      'tIbieUQ0ECu3dtoJZxF/oMcCCQzAm2ixF1QAo8IxclpwwSmAgCTFHK1QwcNfVrBChRSjs' +
      'AEDGTOgwoJsBQEAIfkECAkAAAAsAAAAADYANgCFRIrMpMbk1OL0dKrcvNbs5PL8jLrcbK' +
      'LU9Pb8VJbMxN7srM7shLLcnMLk3Or0/P78zN7sTJLM7PL8nL7kdKbU/Pr8XJ7UtM7sjLb' +
      'czOL0RI7MrMrk1Ob0fK7cxNrslL7kbKbU9Pr8XJrUhLbcnMbk5O70zN707Pb8tNLs////' +
      'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' +
      'AAAAAAAAAAAAAAAAAAABv7AlHBILBqFj5OkxEQ8jtCodBpalhzMkiQ07XqPoSwTiy1xv+' +
      'jpw1rOYiXPtPdBjxPD13E+eybW7WgPCBIFElt2a2JteyeIVUsSTl8PVXtMJxVIS4uccEI' +
      'VVmIFIYBQeG5Znol5ZWRMqmyWZmqoeliNKSdiu1knKYmcYqVFCIq8JZkVBazMDlspyrV6' +
      'JQhRwKiu1L+6x5dPxbuLWsNIy7KK1b+xZIVxxdnNBeS/xq5lvkiDYpF23NO7no5cO4alz' +
      '6cQJxAgMJgCXBt746KcgsikQKZA5s41kbIq3EY577BdCRglGrNX8ziGWiThoppQr0jJGU' +
      'IJZglckyogSChpZv4RnUoQVEjph45Pn3WgUFISaejRLg8cNOgwAAOBdENA7SrQ8ykYAxE' +
      'AiBVrIUOcEBlZEp2JoMNYDQDgAojgQd20bFi9Imkwtu/YBAW4iRtDUq+ECHATx12soYGE' +
      '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' +
      'UxQZGdOZE1DK2s4SDhUNDdvRW94VE4=';
  DomElement _target;
  DomElement _cancelButton;
  Modal _modal;

  DomElement get target => _target;

  ModalLoading() {
    _target = $('<div class="modal" role="dialog" />')
      ..append((DomElement target) {
        target
          ..appendElement($('<div class="modal-dialog modal-sm" />')
            ..append((DomElement target) {
              target
                ..appendElement($('<div class="modal-content" />')
                  ..appendElement($('<div class="modal-body" />')
                    ..appendElement($('<div />')
                      ..css['display'] = 'table'
                      ..css['text-align'] = 'center'
                      ..css['margin'] = '0 auto'
                      ..appendElement($('<p>')
                        ..appendElement($('<img />')
                          ..attr['src'] = _loadingImage
                          ..attr['alt'] = 'Loading...'))
                      ..append((DomElement target) {
                        _cancelButton = $(
                            '<button type="button" class="btn btn-primary" />')
                          ..text = 'Cancel'
                          ..appendTo(target);
                      }))));
            }));
      })
      ..appendTo(find('body'));

    _modal =
        new Modal(_target.nativeElement, keyboard: false, backdrop: 'static');
    _modal.show();
  }

  void onCancel(Function listener) => _cancelButton.on('click', listener);

  void close() {
    _modal.hide();
    _target.remove();
  }
}
