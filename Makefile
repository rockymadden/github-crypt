bindir ?= ./build/bin
uname := $(shell uname -s)
vardir ?= ./build/var

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
	@rsync -a src/ ${bindir}
ifeq (${uname}, Darwin)
	@$(eval _bindir := $(shell greadlink -f ${bindir}))
	@$(eval _vardir := $(shell greadlink -f ${vardir}))
	@sed -i ''  "s|bindir=|bindir=${_bindir}|g" ${bindir}/github-crypt
	@sed -i ''  "s|vardir=|vardir=${_vardir}|g" ${bindir}/github-crypt
else ifeq (${uname}, Linux)
	@$(eval _bindir := $(shell readlink -f ${bindir}))
	@$(eval _vardir := $(shell readlink -f ${vardir}))
	@sed -i "s|vardir=|vardir=${_vardir}|g" ${bindir}/github-crypt
	@sed -i "s|bindir=|bindir=${_bindir}|g" ${bindir}/github-crypt
endif

stub:
	@mkdir -p ${bindir}
	@mkdir -p ${vardir}

test: | install
	@test/github-crypt

uninstall:
	@rm -rf ${bindir}
	@rm -rf ${vardir}

.PHONY: apt brew clean depndencies install stub test uninstall
