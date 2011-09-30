#! /usr/bin/perl -w

open F, "<$ARGV[0]" or die;
my $protons = $ARGV[1];
die unless defined $protons;

my $in_table = 0;
while (<F>)
{
  if (/<th>\s*Isotope\s*<th>\s*conc\s*<th>\s*Coh b\s*<th>/) {
    $in_table = 1;
    last;
  }
}
  
while (<F>)
{
    last if (/<\/table>/);

    s/\<i\>i\<\/i\>//g;

                    # tope                  conc               cohb              incb               cohxs               incxs            scattxs                absxs
    if (/^<td>\s*(\d*)([A-Z][a-z]*)\s*<td>\s*([^<]*?)\s*<td>\s*([^<\s]+)\s*<td>\s*([^<\s]+)\s*<td>\s*([^<\s]+)\s*<td>\s*([^<\s]+)\s*<td>\s*([^<\s]+)\s*<td>\s*(\<?[^<\s]+)\s*<tr>/) {
      my $nucleons = $1;
      my $element = $2;
      my $isotope = "$2$1";
      my $conc = $3;
      my $cohb = $4;
      my $incb = $5;
      my $cohxs = $6;
      my $incxs = $7;
      my $scattxs = $8;
      my $absxs = $9;

      $incb = 0 if $incb*1 eq $incb;
      $cohb = 0 if $cohb*1 eq $cohb;
      $cohxs = 0 if $cohxs*1 eq $cohxs;
      $scattxs = 0 if $scattxs*1 eq $scattxs;
      $absxs = 0 if $absxs*1 eq $absxs;

      if ($nucleons eq '') {
        print "     $isotope: {Z: $protons, cohb: $cohb, incb: $incb, cohxs: $cohxs, incxs: $incxs, scaxs: $scattxs, abs: $absxs },\n"
      } else {
        $neutrons = $nucleons - $protons;
        $mass = $nucleons; 
        print "     $isotope: { A: $nucleons, Z: $protons, N: $neutrons, mass: $mass, conc: $conc, cohb: $cohb, incb: $incb, cohxs: $cohxs, incxs: $incxs, scaxs: $scattxs, abs: $absxs },\n"
      }
    } else {
        warn "error parsing line $_";
    }
}
#print "      },\n" if $in_table;
