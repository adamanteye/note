#!/bin/perl
use strict;
use warnings;
use File::Find;
use Encode qw(decode);
use open qw(:std :utf8);
my $dir = shift // '.';
my $combined = '';
find(
    sub {
        return unless -f $_;
        my $fileinfo = `file -b --mime $_`;
        if ( $fileinfo =~ /text/ ) {
            open my $fh, '<:raw', $_ or warn "cannot open $_: $!" and return;
            my $content = do { local $/; <$fh> };
            close $fh;
            eval { $content = decode('UTF-8', $content, 1) };
            if ($@) {
                warn "skipping non-UTF8 file: $_\n";
                return;
            }
            $combined .= $content;
        }
    },
    $dir
);
my %seen;
my @chars = sort grep { !$seen{$_}++ } split //, $combined;
open my $uniq, '>:utf8', 'build/union.txt' or die "cannot write union.txt: $!";
print $uniq join('', @chars);
close $uniq;
