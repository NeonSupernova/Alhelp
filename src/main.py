from jinja2 import Environment, FileSystemLoader
from collections import namedtuple
import sys

Page = namedtuple("Page", ["name", "href"])

PAGES = {
    'index.html': Page('Home', 'index.html'),
    'mental.html': Page('Mental Illness', 'mental.html'),
    'stats.html': Page('Mental Illness Statistics', 'stats.html'),
    'hotline.html': Page('Crisis Hotline', 'hotline.html'),
    'feedback.html': Page('Feedback', 'feedback.html'),
    'froala.html': Page('Froala Editor', 'froala.html'),
}

def render_template(template_name, **context):
    env = Environment(loader=FileSystemLoader('templates'))
    template = env.get_template(template_name)
    return template.render(**context)

def main(arg):
    page = PAGES.get(arg)
    page_content = render_template(arg, c_page=page.name, pages=PAGES.values())
    with open(f'build/{page.href}', 'w') as file:
        file.write(page_content)

if __name__ == "__main__":
    main(sys.argv[1])
