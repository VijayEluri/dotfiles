# https://github.com/shabble/irssi-docs/wiki
# https://raw.githubusercontent.com/irssi/irssi/master/docs/perl.txt
# https://raw.githubusercontent.com/irssi/irssi/master/docs/signals.txt

use strict;
use vars qw($VERSION %IRSSI $hello);
use Irssi qw(command_bind signal_add settings_add_str settings_get_str);

$VERSION = '1.00';
%IRSSI = (
    authors     => 'phua',
    contact     => 'phua@aleph0',
    name        => 'hello',
    description => 'Hello, world!',
    license     => 'GPL',
    );

command_bind hello => sub {
    my ($data, $server, $witem) = @_;
    print 'Hello, world!';
};

settings_add_str('hello', 'name', 'phua');

signal_add('message public', sub {
    my ($server, $msg, $nick, $address, $target) = @_;
    $_ = $msg;
    $hello = 'Hello, ' . settings_get_str('name') . '\.';
    if (/^$hello$/i) {
        $server->command("MSG $target Hello, $nick!");
        return 0;
    }
});
