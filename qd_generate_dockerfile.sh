#! /bin/bash

## AIMS  : Generate a dockerfile based on theDockerfile.template
## USAGE : qd_generate_dockerfile.sh prog version
## NOTE  : Dockerfile still need to be completed.
## NOTE  : if Dockerfile already exists, it will be moved to a .bk file.
## AUTHORS : sletort@irisa.fr

set -o nounset
set -o errexit

# =========================================================
declare -r PROG="${1?What is your program name ?}"
declare -r VERSION="${2?What is the version of the program ?}"

# ---------------------------------------------------------

# =========================================================
function printVars ()
{
	printf "╔═══════════════════════════════════ ═ ═ ═ ═\n"
	printf "╟ - SCRIPT    = $0\n"
	printf "╟ - PROG      = $PROG\n"
	printf "╟ - VERSION   = $VERSION\n"
	printf "╚═══════════════════════════════════ ═ ═ ═ ═\n\n"
}

# =========================================================
function main ()
{
	local -r OUTDIR="${PROG}/${VERSION}"
	mkdir -p "$OUTDIR"

	if [[ -e "$OUTDIR"/Dockerfile ]]
	then
		cp "$OUTDIR"/Dockerfile "$OUTDIR"/Dockerfile.bk
	fi

	local perle='s/XXXXX/'$PROG'/g;'
	perle=$perle' s/VVVVV/'$VERSION'/g;'
	perl -pe "$perle" Dockerfile.template > "$OUTDIR"/Dockerfile
}

# =========================================================
printVars

# your work.
main

#printf "End of %s.\n\n" $( basename $0 )

exit 0
