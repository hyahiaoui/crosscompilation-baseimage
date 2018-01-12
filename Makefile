.PHONY : build clean shell test

build:
	docker-compose build --no-cache

clean:
	docker-compose kill
	docker-compose rm -f

shell:
	docker-compose run crosscompilation-baseimage shell

test: clean
	docker-compose run --rm crosscompilation-baseimage test
