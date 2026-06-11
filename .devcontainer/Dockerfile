# ============================================================================
# Dockerfile — Build recipe for the course development container
# ============================================================================
#
# A Dockerfile is a plain-text script that Docker reads top-to-bottom to
# build an "image": a frozen, self-contained snapshot of a Linux system
# with every tool pre-installed.  Think of the image as a BLUEPRINT and
# the running container as a HOUSE built from that blueprint — you can
# spin up many identical houses from a single blueprint, and tearing one
# down leaves the blueprint untouched.
#
# Every instruction (FROM, ENV, RUN …) creates an immutable filesystem
# "layer" on top of the previous one.  Docker caches each layer: if you
# change only the last instruction, only that layer is rebuilt — earlier
# layers are reused from cache.  This is why instruction ORDER matters:
# put things that change rarely (base image, env vars) near the top, and
# things that change often (your scripts, config) near the bottom.
# ============================================================================


# ----------------------------------------------------------------------------
# (a) FROM — choose the base image
# ----------------------------------------------------------------------------
# A base image is the starting point every subsequent layer is stacked on.
# Instead of building a Linux system from scratch we reuse the official
# Kali Linux "rolling" image published on Docker Hub.
#
# Why Kali?  BHB Ch. 3 explains that Kali is a Debian-based Linux
# distribution created for penetration testing by OffSec.  It comes
# bundled with the libraries, dependencies, and tools needed for hacking
# labs — nmap, tshark, tor, proxychains4, etc. — without extra setup.
# "rolling" means packages are updated continuously (no fixed releases),
# so :latest always pulls the most recent snapshot.
FROM kalilinux/kali-rolling:latest
# ----------------------------------------------------------------------------
# (b) Layer / cache — why instruction order matters
# ----------------------------------------------------------------------------
# Each Dockerfile instruction that modifies the filesystem creates a new
# layer.  Docker stores layers in a content-addressable cache:
#   • If an instruction and every instruction ABOVE it are unchanged,
#     Docker reuses the cached layer — the build is nearly instant.
#   • If any instruction changes, Docker invalidates that layer AND all
#     layers below it.
# Therefore: stable, rarely-changing instructions (FROM, ENV) go first;
# expensive, frequently-changing steps (big RUN installs) go later so a
# small edit at the bottom doesn't force a full reinstall.
# BHB Ch. 3 introduces Docker as a tool for deploying and managing
# containers where code and dependencies are packaged together so the
# application runs reliably in various environments.
# ----------------------------------------------------------------------------
# (c) ENV — persistent environment variables inside the container
# ----------------------------------------------------------------------------
# Environment variables are named key=value pairs that any process
# running inside the container can read.  BHB Ch. 1 explains that when
# bash starts a new session it loads a set of environment variables —
# you can list them all with the "env" command.  Programs use them to
# discover settings like the default shell, the home directory, or the
# character encoding in use.  Writing them in UPPERCASE is a Unix
# convention (e.g. SHELL, LANG, PATH in BHB Ch. 1 examples).
#
# DEBIAN_FRONTEND=noninteractive
#   Tells apt (the Debian package manager) to run in fully automatic
#   mode: never pause and ask the user a question.  Without this, some
#   packages would freeze the build waiting for keyboard input that will
#   never come — there is no human at a terminal during a Docker build.
#
# LANG=es_ES.UTF-8 / LC_ALL=es_ES.UTF-8
#   Set the locale — the combination of language, territory, and
#   character encoding that programs use when displaying text.
#   UTF-8 is the modern Unicode encoding that supports accented letters
#   (á, é, ñ), the euro sign (€), and virtually every script on Earth.
#   Without a proper locale, many CLI tools misbehave with non-ASCII
#   input.  BHB Ch. 1 shows LANGUAGE as one of the default env vars
#   loaded by bash (e.g. LANGUAGE=en_CA:en in the env output example).
#
# TERM=xterm-256color
#   Tells the terminal emulator library (ncurses/terminfo) that the
#   terminal supports 256 colors.  Interactive tools like vim, nvim,
#   htop, and the zsh prompt use this to display colors correctly.
#
# The trailing backslash "\" continues the same logical line across
# multiple lines — purely cosmetic, for readability.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color
# ----------------------------------------------------------------------------
# (d) RUN debconf-set-selections — pre-answer Wireshark's interactive prompt
# ----------------------------------------------------------------------------
# When Wireshark/tshark is installed, its post-install script asks:
#   "Should non-superusers be able to capture packets?"
# Because DEBIAN_FRONTEND=noninteractive silences apt, the safest fix is
# to pre-load the answer ("false" = only root can capture, which is fine
# since the container runs as root) into the debconf database BEFORE apt.
#
# The pipe "|" sends the text printed by echo directly into
# debconf-set-selections as its standard input.  BHB Ch. 1 explains the
# pipe operator: "redirects the output of a command and uses it as the
# input of another" (Table 1-4, Redirection Operators).  This is a
# classic Unix pipe — one command's stdout feeds another's stdin.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections 




