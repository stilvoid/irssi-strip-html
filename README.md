# irssi-strip-html

This script uses the wonderful [html2text](https://github.com/aaronsw/html2text) to convert HTML messages into more readable markdown before they're output to your irssi window.

## Installation

Put the file `strip_html.pl` into your `.irssi/scripts` folder.

Then in irssi:

    /script load strip_html

Use the `strip_html_chatnet` setting to choose which chatnet to apply HTML stripping to:

    /set strip_html_chatnet hipchat
