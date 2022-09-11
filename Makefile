# from: # https://github.com/benmezger/dotfiles

LOGFILE=/tmp/dotfiles.log

default: run
help:
	@echo 'Management commands for dotfiles:'
	@echo
	@echo 'Usage:'
	@echo '    make start-services     Starts services (systemd, brew services..).'
	@echo '    make git-repos          Clone Git repos.'
	@echo '    make conf-sys           Configure system files.'
	@echo '    make ssh-perms          Set SSH permissions.'
	@echo '    make gnupg-perms        Set GnuPG permissions.'
	@echo '    make pyenv              Install pyenv.'
	@echo '    make ensure-deps        Install all dependencies.'
	@echo '    make chezmoi-init       Initialize chezmoi.'
	@echo '    make chezmoi-apply      Apply chezmoi files (runs all scripts).'
	@echo '    make post-chezmoi       Run post chezmoi scripts.'
	@echo '    make install-homebrew   Install Homebrew.'
	@echo '    make install-chezmoi    Install chezmoi.'
	@echo '    make install-deps       Install system dependencies.'
	@echo '    make ensure-dirs        Creates required directories.'
	@echo '    make install-rust       Install Rust.'
	@echo '    make install-go-deps    Install go dependencies.'

	@echo
	@echo '    make run                Ensure deps and apply chezmoi.'
	@echo '    make all                Run all.'
	@echo
	@echo '    Logs are stored in      $(LOGFILE)'

start-services:
	@echo "Starting services.."
	bash ./scripts/start_services.sh | tee -a $(LOGFILE) || exit 1

git-repos:
	@echo "Cloning Git repos.."
	bash ./scripts/install_git_repos.sh | tee -a $(LOGFILE) || exit 1

conf-sys:
	@echo "Configuring system.."
	bash ./scripts/configure_sys.sh | tee -a $(LOGFILE) || exit 1

ssh-perms:
	@echo "Setting SSH permissions.."
	bash ./scripts/set_ssh_perms.sh | tee -a $(LOGFILE) || exit 1

gnupg-perms:
	@echo "Setting GnuPG permissions.."
	bash ./scripts/fix_gnupg_perms.sh | tee -a $(LOGFILE) || exit 1

pyenv:
	@echo "Installing pyenv.."
	bash ./scripts/install_pyenv.sh | tee -a $(LOGFILE) || exit 1

install-chezmoi:
	@echo "Installing chezmoi.."
	bash ./scripts/install_chezmoi.sh | tee -a $(LOGFILE) || exit 1

install-deps:
	@echo "Installing dependencies.."
	bash ./scripts/install_deps.sh | tee -a $(LOGFILE) || exit 1

install-homebrew:
	@echo "Installing homebrew.."
	bash ./scripts/install_homebrew.sh | tee -a $(LOGFILE) || exit 1

ensure-dirs:
	@echo "Ensuring directories.."
	bash ./scripts/ensure_directories.sh | tee -a $(LOGFILE) || exit 1

install-rust:
	@echo "Installing rust.."
	bash ./scripts/install_rust.sh | tee -a $(LOGFILE) || exit 1

install-go-deps:
	@echo "Installing go packages.."
	bash ./scripts/install_go_packages.sh | tee -a $(LOGFILE) || exit 1

ensure-deps:
	@echo "Ensuring dependencies.."
	$(MAKE) install-homebrew
	$(MAKE) install-chezmoi
	$(MAKE) install-deps
	$(MAKE) install-rust
	$(MAKE) install-go-deps

chezmoi-init:
	@echo "Initializing chezmoi.."
	chezmoi init -S ${CURDIR} -v

chezmoi-apply:
	@echo "Applying chezmoi.."
	chezmoi apply -v

all:
	$(MAKE) ensure-deps
	$(MAKE) start-services
	$(MAKE) git-repos
	$(MAKE) conf-sys
	$(MAKE) ssh-perms
	$(MAKE) gnupg-perms
	$(MAKE) chezmoi-init
	$(MAKE) ensure-dirs
	$(MAKE) chezmoi-apply

run:
	$(MAKE) ensure-deps
	$(MAKE) chezmoi-init
	$(MAKE) chezmoi-apply

post-chezmoi:
	$(MAKE) start-services
	$(MAKE) git-repos
	$(MAKE) conf-sys
	$(MAKE) ssh-perms
	$(MAKE) gnupg-perms
	$(MAKE) ensure-dirs
	$(MAKE) pyenv
	@echo "Done"
