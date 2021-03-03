# -----------------------------------------------------------
#
# Setup for container usage
#
# -----------------------------------------------------------

if which podman 1>&2 > /dev/null; then
    CNTR_TECH=podman
elif which docker 1>&2 > /dev/null; then
    CNTR_TECH=docker
fi

if [ -n CNTR_TECH ]; then
    alias jekyll='${CNTR_TECH}   run --rm --volume="$PWD:/srv/jekyll" boekhoff/jekyll-asciidoc:latest jekyll'
    alias asciidoc='${CNTR_TECH} run --rm --volume="$PWD:/documents" asciidoctor/docker-asciidoctor:latest asciidoctor'
fi
