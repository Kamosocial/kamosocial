all:
		@echo 'Please use "make serve" or "make test"'


.PHONY: test
test:
		@bin/rails test

.PHONY: serve
serve:
		@source ${PWD}/.env && bin/rails server
