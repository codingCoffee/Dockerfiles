
# Dockerfiles

This is a repo to hold various Dockerfiles for images I modify and maintain for
personal use. :bowtie:

This is more or less a clone of [Jess Frazelle's Dockerfiles](https://github.com/jessfraz/dockerfiles), but built with Archlinux in mind. Most of her images are built on Debian and the group ids of `audio` and `video` groups are different on `debian` (90) and `archlinux` (91) causing the X11 applications like Chrome etc to not be able to play sound even after mounting the `/dev/snd` device. So I created this.
If you're not using Archlinux as the host OS, you're better off using [Jess Frazelle's Dockerfiles](https://github.com/jessfraz/dockerfiles)

## TODO

- [ ] CI to auto build and push images to Docker Hub

