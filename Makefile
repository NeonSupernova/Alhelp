.PHONY: all clean

all: build/index.html build/mental.html build/stats.html build/hotline.html build/feedback.html

configure:
	@./configure.sh

clean:
	rm -rf output/*

venv:
	python -m venv venv
	source ./venv/bin/activate; python -m pip install -r requirements.txt

build/index.html: venv templates/base.html.jinja templates/index.html
	python src/main.py index.html

build/mental.html: venv templates/base.html.jinja templates/mental.html
	python src/main.py mental.html

build/stats.html: venv templates/base.html.jinja templates/stats.html
	python src/main.py stats.html

build/hotline.html: venv templates/base.html.jinja templates/hotline.html
	python src/main.py hotline.html

build/feedback.html: venv templates/base.html.jinja templates/feedback.html
	python src/main.py feedback.html
