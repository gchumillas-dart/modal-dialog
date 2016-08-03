# Modal Dialog System

A Modal Dialog System based on the Bootstrap framework.

## Install

Edit your `pubspec.yaml` and add the library dependency:

```yaml
dependencies:
  modal_dialog: <version number>
```

Gets the dependencies:

```bash
> pub get
```

Adds the Bootstrap's CSS link to your web page (see [Getting started - Bootstrap](http://getbootstrap.com/getting-started/)):

```html
<!DOCTYPE html>
<html>
<head>
</head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!--
    Alternatively you can use the minified CSS file provided by the Bootjack library:
    <link rel="stylesheet" href="packages/bootjack/css/bootstrap.min.css">
    -->
```

And finally import the library from the source code:

```dart
import 'package:modal_dialog/core.dart';

void main() {
  new ModalConfirm('Delete record', 'Are you sure?',
      accept: (ModalDialog dialog) {
    print('deleting record...');
    dialog.close();
  });
}
```

## Examples

1. Creates a Modal Message with two buttons:
```dart
new ModalMessage('Delete record', 'Are you sure')
  ..addButton('Cancel')
  ..addButton('Accept', type: 'primary', action: (ModalDialog dialog) {
    print('Deleting record..');
    dialog.close();
  });
```

2. The previous example can be written easily by using the `ModalConfirm` class:
```dart
new ModalConfirm('Delete record', 'Are you sure?', accept: (ModalDialog dialog) {
  print('Deleting record..');
  dialog.close();
});
```
