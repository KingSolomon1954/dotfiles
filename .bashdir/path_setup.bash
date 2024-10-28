# -----------------------------------------------------------
#
# Setup the PATH
#
# -----------------------------------------------------------

# Read in path library helper functions
#
if [ -f ~/.bashdir/libEnv.bash ]; then
    . ~/.bashdir/libEnv.bash
fi

# Construct our PATH using functions from the environment
# variable path library. When using ksl::envAppend(), if the
# given directory does not exist on the file space, then PATH
# is left untouched. The function will alo prevent adding
# duplicates. With this behavior, the path for all OS's and
# hosts can be easily handled here without additional special
# OS tests.

# Standard system path setup here
#
ksl::envAppend -f PATH "/bin"
ksl::envAppend -f PATH "/usr/bin"
ksl::envAppend -f PATH "/usr/local/bin"
ksl::envAppend -f PATH "/sbin"
ksl::envAppend -f PATH "/usr/sbin"
ksl::envAppend -f PATH "/usr/local/sbin"
ksl::envAppend -f PATH "${HOME}/.local/bin"
ksl::envAppend -f PATH "${HOME}/bin"
ksl::envDelete    PATH "/usr/games"
ksl::envDelete    PATH "/usr/local/games"

# Some platform specific setup

ksl::envPrepend -f PATH "/usr/local/opt/m4/bin"
ksl::envPrepend -f PATH "/usr/local/opt/openssl/bin"
ksl::envPrepend -f PATH "/usr/local/opt/findutils/libexec/gnubin"
ksl::envPrepend -f PATH "/usr/local/opt/coreutils/libexec/gnubin"
ksl::envPrepend -f PATH "/usr/local/opt/grep/libexec/gnubin"
ksl::envPrepend -f PATH "/usr/local/opt/make/libexec/gnubin"
