#!/usr/bin/perl
#
#   Perl Makefile for WattsUp-Daemon
#
#   Invoke with 'perl Makefile.PL'
#
#   See ExtUtils::MakeMaker (3) for more information on how to influence
#    the contents of the Makefile that is written
#

use ExtUtils::MakeMaker;

WriteMakefile(
              NAME			=> 'WattsUp-Daemon',
              VERSION_FROM  => 'wattsup-daemon',
              ABSTRACT		=> "Watt's Up Monitoring Daemon",
              EXE_FILES     => ['wattsup-daemon'],
              AUTHOR        => 'Robin H. Johnson <robbat2@gentoo.org>',
			  PREREQ_PM     => {
			  'Device::SerialPort' => 0,
			  'Time::TAI64'       => 0,
			  'Time::HiRes'       => 0,
			  },
		);

sub MY::postamble {
return <<MAKE_FRAG
create_distdir: changelog
.FORCE: changelog
changelog:
	git log >ChangeLog
MAKE_FRAG
};
