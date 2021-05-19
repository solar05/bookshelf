
.PHONY: test
run:
	bin/rails server
console:
	bin/rails console
migrate:
	bin/rails db:migrate
reset:
	bin/rails db:reset
test:
	bin/rails test
