# https://github.com/shabble/irssi-docs/wiki
#
# https://raw.githubusercontent.com/irssi/irssi/master/docs/perl.txt
# https://raw.githubusercontent.com/irssi/irssi/master/docs/signals.txt

# package Irssi::Script::hello

use strict;
use warnings;

# use vars qw($VERSION %IRSSI);

use Irssi qw(command_bind signal_add signal_add_first
    settings_add_str settings_get_str);

our $VERSION = '1.00';
our %IRSSI = (
    authors     => 'phua',
    contact     => 'phua@aleph0',
    name        => 'hello',
    description => 'Hello, world!',
    license     => 'GPL',
);

command_bind help => sub {
    if (($_[0] =~ s/^\s+|\s+$//r) eq 'hello') {
        Irssi::print('Print "Hello, world!".', MSGLEVEL_CLIENTCRAP);
        Irssi::signal_stop();
    }
};

sub UNLOAD {
    Irssi::print('Goodbye, cruel world!', MSGLEVEL_CLIENTCRAP);
};

command_bind hello => sub {
    my ($data, $server, $witem) = @_;
    if ($witem) {
        $witem->print('Hello, world!');
    } else {
        print('Hello, world!');
    }
};

settings_add_str('hello', 'name', 'phua');

signal_add 'message private' => sub {
    my ($server, $msg, $nick, $address, $target) = @_;
    my $hello = 'Hello, ' . settings_get_str('name') . '\.';
    if ($msg =~ /^$hello$/i) {
        $server->command("MSG $target Hello, $nick!");
        return 0;
    }
};
