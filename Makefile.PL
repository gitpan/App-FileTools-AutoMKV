
use strict;
use warnings;

BEGIN { require 5.008; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Automatic MKV converter, with (we hope) smart behavior',
  'AUTHOR' => 'Stirling Westrup <swestrup@gmail.com>',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'App-FileTools-AutoMKV',
  'EXE_FILES' => [
    'bin/automkv'
  ],
  'LICENSE' => 'gpl',
  'NAME' => 'App::FileTools::AutoMKV',
  'PREREQ_PM' => {
    'Archive::Any' => '0',
    'Capture::Tiny' => '0',
    'Carp' => '0',
    'Cwd' => '0',
    'Data::Dump' => '0',
    'DateTime' => '0',
    'Encode' => '0',
    'File::Basename' => '0',
    'File::MimeInfo::Magic' => '0',
    'File::Spec' => '0',
    'FileHandle' => '0',
    'FindBin' => '0',
    'Getopt::Long' => '0',
    'IO::Interactive' => '0',
    'Lingua::EN::Titlecase' => '0',
    'Locales' => '0',
    'MIME::Types' => '0',
    'Pod::Text::Termcap' => '0',
    'Pod::Usage' => '0',
    'String::ShellQuote' => '0',
    'Text::Balanced' => '0',
    'enum' => '0',
    'open' => '0',
    'utf8' => '0'
  },
  'VERSION' => '0.01',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



