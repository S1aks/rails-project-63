# Makefile
install: # установить зависимости
	bundle install

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

tests:
	bundle exec rake test
