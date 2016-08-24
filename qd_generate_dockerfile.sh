#! /bin/bash

## AIMS  : Generate a dockerfile based on theDockerfile.template
## USAGE :
## NOTE  :
## AUTHORS : sletort@irisa.fr

set -o nounset
set -o errexit

# =========================================================
declare -r INFILE="${1?What is your input file ?}"

# ---------------------------------------------------------
#declare -r MG_MAP_DIR="/PUBLIC_DATA/GENERATED/1kG/map_files"

# =========================================================
function printVars ()
{
	printf "╔═══════════════════════════════════ ═ ═ ═ ═\n"
	printf "╟ - SCRIPT     = $0\n"
	printf "╟ - INFILE     = $INFILE\n"
	printf "╚═══════════════════════════════════ ═ ═ ═ ═\n\n"
}

# =========================================================
function main ()
{
}

# =========================================================
printVars

# your work.
main

printf "End of %s.\n\n" $( basename $0 )

exit 0
