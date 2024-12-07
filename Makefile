build:
	docker inspect --type=image embedded_radxa/debian/bookworm:latest 1>/dev/null || docker build -t embedded_radxa/debian/bookworm:latest .
	docker run -it --rm -v .:/build embedded_radxa/debian/bookworm:latest bash -c "source sources/poky/oe-init-build-env machine/rock5a && bitbake -k core-image-minimal"
