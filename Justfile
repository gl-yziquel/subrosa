[private]
@default:
	echo
	echo Task runner for the Sub-Rosa project.
	echo ─────────────────────────────────────
	echo
	just --list --unsorted --justfile "{{ justfile() }}"
	echo

import ? "local.just"

# Shows the readme file.
readme:
	@bat README.md

# Formats the versioned files.
format:
	cat README.md | par "-P=[-=>" > .README.md.par && mv .README.md.par README.md

# Installs the code.
install:
	ln -s {{ justfile_directory() }}/subrosa `tomlq install.path -f Install.toml`/subrosa
