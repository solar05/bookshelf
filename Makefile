.PHONY: test
setup:
	bin/rails db:setup; \
	bin/rails db:migrate
run:
	bin/rails server
console:
	bin/rails console
lint:
	bundle exec rubocop
lint-fix:
	bundle exec rubocop -A
reset:
	bin/rails db:reset
test:
	bin/rails test
compose:
	docker-compose up
compose-setup:
	docker build -t bookshelf .; \
  docker-compose build; \
  docker-compose run --rm web bash -c "bundle install"; \
  docker-compose run --rm web bash -c "make setup"
