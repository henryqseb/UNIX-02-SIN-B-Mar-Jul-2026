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
# (e) RUN apt-get update && apt-get install … — the main package install
# ----------------------------------------------------------------------------
# Everything is chained into ONE single RUN for an important reason:
# each RUN creates a new layer.  If "apt-get update" ran in one RUN and
# "apt-get install" in a second, Docker might cache the update layer and
# use a stale package list on future builds — or we'd end up with two
# layers instead of one, making the image bigger.  One RUN = one layer =
# smaller, fresher image.
#
# Key flags:
#   -y                      Answers "yes" to all apt confirmation prompts
#                           automatically.  BHB Ch. 1 shows that commands
#                           accept short-form arguments with a single dash
#                           (e.g. ls -l, apt-get install -y).
#   --no-install-recommends Install ONLY the required dependencies, not
#                           the "recommended" extras.  Saves hundreds of
#                           MB in a container image.
#
# "&&" runs the next command ONLY if the previous one succeeded (exit
# code 0).  BHB Ch. 1 Table 1-3 (Control Operators) defines && as a
# logical AND: "the second command will be evaluated only if the first
# command evaluates to true."  If apt-get update fails, the install step
# never runs and the build fails with a clear error — exactly what we
# want.
#
# The trailing backslash "\" continues the RUN across many lines for
# readability.
#
# Selected tools explained (with BHB references):
#   gawk       GNU awk — a data-processing Swiss Army knife.  BHB Ch. 2
#              shows awk extracting specific fields from log files with
#              '{print $1}', filtering with NR, and changing delimiters
#              with -F.  Essential for parsing structured text output.
#   sed        Stream editor — takes actions on text (replace, delete,
#              print lines).  BHB Ch. 2 demonstrates s/old/new/g for
#              global substitution, -i for in-place editing of files,
#              and d for deleting lines.
#   grep       Filters lines matching a regular expression from streams
#              or files.  BHB Ch. 2 covers grep -i (case-insensitive),
#              -v (exclude lines), -o (print only match), -e (multiple
#              patterns), and combining it with pipes: "ps | grep TTY".
#   shellcheck Static analysis linter for shell scripts — catches bugs
#              like unquoted variables before you run the script.
#              BHB Ch. 1 stresses debugging; shellcheck automates early
#              error detection (complements bash -n dry-run checking).
#   nmap       Network Mapper — discovers hosts, open ports, and services
#              on a network.  BHB Ch. 3 installs it as part of the
#              hacking lab toolset on Kali.
#   tcpdump    Command-line packet capture tool — records raw network
#              traffic live or to a file.  Part of the Kali security
#              toolkit covered in BHB Ch. 3.
#   tshark     Terminal version of Wireshark — decodes and filters
#              captured packets using deep protocol dissectors.
#   tor        Anonymity network client — routes traffic through a chain
#              of encrypted relays to hide the origin IP.  BHB Ch. 3
#              sets up the full offensive lab environment where tools
#              like tor and proxychains4 are standard.
#   proxychains4 Forces any TCP connection from any program through one
#              or more proxies (SOCKS4/5, HTTP); often used to route
#              nmap or curl through Tor.
#   jq         Command-line JSON processor — parses, filters, and
#              transforms JSON output from APIs and other tools.
#              Like sed/awk (BHB Ch. 2) but purpose-built for JSON.
#   man-db     The manual-page system.  BHB Ch. 1 shows "man ls" and
#              explains that the man command opens "a terminal-based
#              guide that explains that command's use and options".
#              The Kali base image strips man pages to save space; we
#              reinstall them because man bash / man grep are primary
#              course references.
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Text editors and shells ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Core text-processing tools (BHB Ch. 2) ===
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Core UNIX utilities ===
    # coreutils  — cat, ls, head, tail, sort, cut, tr, wc …
    # findutils  — find and xargs
    # procps     — ps, top, kill (process management)
    # less       — paginator for reading long files one screen at a time
    # tree       — displays directory trees visually
    # jq         — JSON processor for the command line (BHB Ch. 2)
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Manual pages (BHB Ch. 1 — "man" command) ===
    man-db \
    manpages \
    manpages-posix \
    \
    # === Download and version-control utilities ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Shell script linter ===
    shellcheck \
    \
    # === Network reconnaissance (BHB Ch. 3) ===
    nmap \
    masscan \
    \
    # === Packet capture and analysis (BHB Ch. 3) ===
    tcpdump \
    tshark \
    \
    # === Miscellaneous networking tools ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonymization / proxy tools (BHB Ch. 3) ===
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Human-friendly HTTP client ===
    httpie \
    \
# ----------------------------------------------------------------------------
# (f) sed + locale-gen — enable the Spanish UTF-8 locale
# ----------------------------------------------------------------------------
# /etc/locale.gen lists every available locale; lines starting with "#"
# are disabled.  The sed command uses the s/old/new/ substitution to
# remove the comment character from the "es_ES.UTF-8" line, activating
# it.  Then locale-gen compiles the binary locale files that glibc uses
# at runtime.
# BHB Ch. 2 demonstrates sed's substitution command: "sed 's/Mozilla/
# Godzilla/g' log.txt" — same pattern used here to uncomment the line.
# The -i flag makes the change in-place on the actual file, just as BHB
# Ch. 2 shows with "sed -i '1d' log.txt".
    && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
    && locale-gen \
    \
# ----------------------------------------------------------------------------
# (g) apt-get clean + rm -rf /var/lib/apt/lists/* — shrink the image
# ----------------------------------------------------------------------------
# After installation, apt leaves two kinds of waste on disk:
#   1. Downloaded .deb package files → "apt-get clean" deletes them.
#   2. Package index files from "apt-get update" stored in
#      /var/lib/apt/lists/ → "rm -rf" removes them entirely.
#
# Both deletions happen inside THIS SAME RUN instruction.  If we put
# them in a separate RUN later, those files would still exist in the
# earlier layer and still contribute to the final image size.  Keeping
# everything in one RUN means the committed layer never contained those
# files in the first place — the image stays as small as possible.
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# ----------------------------------------------------------------------------
# (h) SHELL — switch subsequent RUN steps from sh to bash
# ----------------------------------------------------------------------------
# By default Docker executes RUN commands with /bin/sh, the minimal
# POSIX shell.  BHB Ch. 3 notes that newer Kali releases use zsh by
# default and shows "sudo usermod --shell /bin/bash kali" to set bash
# as the default shell — the same concept applies here.  sh lacks
# Bash-specific syntax: arrays, [[ ]], process substitution, etc.
# Switching to bash ensures any RUN instruction added later can use the
# full Bash feature set that BHB Ch. 1 and Ch. 2 teach.
SHELL ["/bin/bash", "-c"]
# ----------------------------------------------------------------------------
# (i) WORKDIR — set the default working directory
# ----------------------------------------------------------------------------
# WORKDIR sets the directory that subsequent RUN, COPY, and CMD
# instructions — and the shell you get when you open a terminal inside
# the container — will start from.  BHB Ch. 1 uses "cd ~" (tilde = home
# directory of the current user) to navigate before running scripts —
# WORKDIR is the Docker equivalent of that cd, applied at build time.
# GitHub Codespaces mounts the repository at /workspaces/<repo-name>,
# so setting /workspaces here means every terminal session opens one
# level above the project files, which is the expected Codespace layout.
WORKDIR /workspaces


