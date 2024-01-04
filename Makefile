.PHONY: all clean

all: build/index.html build/mental.html build/stats.html build/hotline.html build/feedback.html build/froala.html

clean:
	rm -rf build/*

PYTHON = ./venv/bin/python

venv:
	python -m venv venv
	$(PYTHON) -m pip install -r requirements.txt

build/index.html: venv templates/base.html.jinja templates/index.html src/main.py
	$(PYTHON) src/main.py index.html

build/mental.html: venv templates/base.html.jinja templates/mental.html src/main.py
	$(PYTHON) src/main.py mental.html

build/stats.html: venv templates/base.html.jinja templates/stats.html src/main.py
	$(PYTHON) src/main.py stats.html

build/hotline.html: venv templates/base.html.jinja templates/hotline.html src/main.py
	$(PYTHON) src/main.py hotline.html

build/feedback.html: venv templates/base.html.jinja templates/feedback.html src/main.py
	$(PYTHON) src/main.py feedback.html

build/froala.html: venv templates/base.html.jinja templates/froala.html src/main.py
	$(PYTHON) src/main.py froala.html
