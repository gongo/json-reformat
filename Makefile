CASK ?= cask
EMACS ?= emacs

.PHONY: test

test: elpa
	${CASK} exec ${EMACS} -Q --batch \
		--load json-reformat.el \
		--load json-reformat-test.el \
		-f ert-run-tests-batch-and-exit

elpa: Cask
	${CASK} install
	touch $@
