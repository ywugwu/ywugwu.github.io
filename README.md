# Yu Wu's personal website

Source for [ywugwu.github.io](https://ywugwu.github.io), built with Jekyll and the plugin-based al-folio v1 theme.

The repository intentionally keeps only site-owned content, configuration, and assets. Shared theme layouts, components, styles, icons, and JavaScript are supplied by versioned Ruby gems. The local homepage layout and `personal` Sass module provide the site's minimal, text-first presentation; publication data and social links remain in `_bibliography/papers.bib` and `_data/socials.yml`.

## Local development

```sh
bundle install
bundle exec jekyll serve
```

Then open <http://127.0.0.1:4000>.

Before publishing, run:

```sh
bundle exec al-folio upgrade audit --no-fail
bundle exec al-folio upgrade overrides audit
bundle exec jekyll build
```
