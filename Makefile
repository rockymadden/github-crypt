prefix ?= ./build
uname := $(shell uname -s)

apt:
ifeq (${uname}, Linux)
	@add-apt-repository ppa:duggan/bats -y
	@apt-get update
	@apt-get install bats
endif

brew:
ifeq (${uname}, Darwin)
	@brew install bats
endif

clean: | uninstall

dependencies: | apt brew

install: | stub
	@rsync -a src/ ${prefix}/bin

stub:
	@mkdir -p ${prefix}/bin

test: | install
	@test/github-crypt

uninstall:
	@rm -rf ${prefix}

.PHONY: apt brew clean depndencies install stub test uninstall
