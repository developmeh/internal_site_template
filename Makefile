SHELL := /bin/sh

prepare:
	cd content
	echo "Migrating Index from README.md to _index.md"
	../scripts/gen_index
	echo "Injecting frontmatter where missing"
	find . -type f -name "*.md" -exec bash -c '../scripts/frontmatter "$0"' {} \;
	echo "Helping native navigation by unwrapping `content` root directory"
	../scripts/unwrap_content


.PHONY: prepare
