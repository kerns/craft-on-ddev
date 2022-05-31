.PHONY: build dev serve bundle composer craft npm pull up install

build: up
	@echo "Preparing to build..."
	@ddev exec npm run build
dev: build
	ddev exec npm run serve
serve:
	ddev exec npm run serve
bundle:
	ddev exec npm run build
composer: up
	ddev composer \
		$(filter-out $@,$(MAKECMDGOALS))
craft: up
	ddev exec php craft \
		$(filter-out $@,$(MAKECMDGOALS))
npm: up
	ddev exec npm \
		$(filter-out $@,$(MAKECMDGOALS))
pull: up
	ddev exec bash scripts/pull_assets.sh
	ddev exec bash scripts/pull_db.sh
install: up build
	@echo ""
	@echo "Preparing to install Craft..."

# 👇 set_primary_site_url executes a custom command (shell script) within the web container which
# sets the default PRIMARY_SITE_URL of your Craft .env file to match your ddev site name ${DDEV_SITENAME}.
# View the script in .ddev/commands/web/set_primary_site_url.sh
#
# Custom commands in ddev are extremely powerful and easy to implement.
# https://ddev.readthedocs.io/en/stable/users/extend/custom-commands/
	@ddev set_primary_site_url

	@ddev exec php craft setup/app-id \
		$(filter-out $@,$(MAKECMDGOALS))
	@ddev exec php craft setup/security-key \
		$(filter-out $@,$(MAKECMDGOALS))
	@echo ""
	@ddev exec php craft install \
		$(filter-out $@,$(MAKECMDGOALS))
	@echo ""
	@echo "Installing plugins..."
	@ddev exec php craft plugin/install vite
	@ddev exec php craft plugin/install templatecomments
	@ddev exec php craft plugin/install postmark

# 👆You can expand this list of plugins however you like.
# Just remember to update requirements in composer.json.default

	@echo "*** DONE ***"
	@ddev describe
	@ddev launch

up:
	@echo "Preflight check..."
	@if [ ! "$$(ddev describe | grep running)" ]; then \
        ddev auth ssh; \
        ddev start; \
        ddev composer install; \
        ddev exec npm install --loglevel=error --no-fund; \
    fi
%:
	@:
# ref: https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line
