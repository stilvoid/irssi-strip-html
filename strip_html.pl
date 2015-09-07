use strict;

use Irssi;

our $VERSION = '0.1';
our %IRSSI = (
	authors => 'Steve Engledow',
	contact => 'steve@offend.me.uk',
	name => 'strip_html',
	description => 'Strip HTML tags from input',
	license => 'MIT',
);

sub sig_strip_html {
	my ($server, $message, $nick, $address, $target) = @_;

	my $wi = Irssi::active_win()->{active};
	return unless ref $wi and $wi->{type} eq 'CHANNEL';
	return unless $wi->{server}->{chatnet} eq
		Irssi::settings_get_str('strip_html_chatnet');

    $message = `echo "$message" | html2text 2>/dev/null`;

    $message =~ s/[\s\n]+$//;

    Irssi::signal_continue($server, $message, $nick, $address, $target)
}

Irssi::settings_add_str('strip_html_chatnet', 'strip_html_chatnet', '');
Irssi::signal_add('message public', \&sig_strip_html);
