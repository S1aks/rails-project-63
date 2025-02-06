# Makefile
install: # установить зависимости
	bundle install

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

testing:
	bundle exec rake test
