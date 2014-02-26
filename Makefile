export EMACS ?= emacs

.PHONY: test

test:
	${EMACS} -Q --batch \
		--load json-reformat.el \
		--load json-reformat-test.el \
		-f ert-run-tests-batch-and-exit
