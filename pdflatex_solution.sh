#!/usr/bin/env bash




#This script creates a solutions version of 'tex' file and a nonsolution verison, and cleans everything up.

#Usage:
#pdflatex_solution <filename.tex>

#To install, clone the git repo or copy the script to any directory, and then add the following line
#to yout bash bash (.bash_profile, which is found in you home directory)

#alias pdflatex_solution="bash /<path to script>/pdflatex_solution.sh




filename=$1
outfile=$2

echo $filename
echo $outfile
pdflatex "$filename"

# a hack to make sure page numbers show up
sleep 3

pdflatex "$filename"

basefilename="${filename%.*}"

rm "${basefilename}.log"
rm "${basefilename}.aux"
rm "${basefilename}.out"

echo '\def\SHOWSOLUTIONS{}' | cat - "${filename}" > "${basefilename} Solution.tex"

pdflatex "${basefilename} Solution.tex"
sleep 3
pdflatex "${basefilename} Solution.tex"

rm "${basefilename} Solution.log"
rm "${basefilename} Solution.aux"
rm "${basefilename} Solution.out"
rm "${basefilename} Solution.tex"
