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





