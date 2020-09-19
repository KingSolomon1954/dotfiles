# -----------------------------------------------------------
#
# Setup for docker usage
#
# -----------------------------------------------------------

if which podman 1>&2 > /dev/null; then
    CNTR_EXEC=podman
elif which docker 1>&2 > /dev/null; then
    CNTR_EXEC=docker
fi

if [ -n CNTR_EXEC ]; then
    alias jekyll='${CNTR_EXEC}   run --rm --volume="$PWD:/srv/jekyll" boekhoff/jekyll-asciidoc:latest jekyll'
    alias asciidoc='${CNTR_EXEC} run --rm --volume="$PWD:/documents" asciidoctor/docker-asciidoctor:latest asciidoctor'
fi
