
.PHONY: test
run:
	bin/rails server
console:
	bin/rails console
lint:
	bundle exec rubocop
lint-fix:
	bundle exec rubocop -A
migrate:
	bin/rails db:migrate
reset:
	bin/rails db:reset
test:
	bin/rails test
