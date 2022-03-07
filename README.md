# Craft on DDEV

**Dockerized local development for Craft CMS, pre-configured with Vite and built on DDEV.**


## Features

- [DDEV](https://ddev.com/get-started/) for local development in a Docker setup that just works
- [Vite](https://vitejs.dev/) for HMR with live reloading in development, and asset optimization bundling for production
- [Tailwind 3.x](https://tailwindcss.com) for utility-first CSS and [Alpine](https://alpinejs.dev/) for lightweight reactivity


## Installation

### 1. Getting Started

Make sure you have installed [Docker](https://www.docker.com/), [DDEV](https://ddev.com/) and [Composer](https://getcomposer.org/) before continuing.

* Docker Desktop - Visit [docker.com/get-started](https://www.docker.com/get-started)
* DDEV - Visit [ddev.com/get-started/](https://ddev.com/get-started/)
* Composer - You could visit [getcomposer.org/](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos) but if you're using macOS and already running Homebrew, simply run `brew install composer`.

With that behind you, open a terminal prompt and run:

```shell
composer create-project kerns/craft-on-ddev <YOUR PATH HERE> --no-install && cd <YOUR PATH HERE>
```

Make sure that `<YOUR PATH HERE>` is the location of a **new** or **existing and empty** folder.

### 2. Configuring DDEV

You could skip this step if you're happy settling for the default domain, `https://craftcms.ddev.site`. But cool kidz don't settle for default domains. Demonstrate your commitment to this project by specifying a custom domain. Do so by running the following command from the root of the directory you just created:

```shell
ddev config
```

Follow the prompts.

- **Project name:** e.g. `my-website` would result in a project URL of `https://my-website.ddev.site` (make note of this for later when you're setting up Craft)
- **Docroot location:** defaults to `web` and should be kept as-is
- **Project Type:** defaults to `php` and should be kept as-is

### 3. Installing Craft

Finally, to install a clean version of Craft, run the following command and follow the prompts.

```shell
make install
```

This does the heavy lifting of spinning up and configuring a sane, Dockerized development environment running the latest version of Craft CMS. It also installs a selection of plugins for Craft as defined in `composer.json.default`. You can edit/expand this list however you like, just remember to mirror those choices in your `Makefile`.

**Pay special attention to the Craft installation prompts**. After setting the admin's account credentials, you'll be prompted for your desired site name and url.

Note that the url defaults to `https://craftcms.ddev.site`. If you ran `ddev config` and specified a custom name for your project (e.g. "my-project"), then the url of your project has been changed accordingly. Answer this prompt with that full url (😎 e.g. `https://my-website.ddev.site`).

_💡 If you're unclear or forgot to note the url, open another terminal window in the same directory and run `ddev describe`_


## Usage


To begin development with Vite's dev server run:

```shell
make dev
```

This command will:

1. Copy your local SSH keys into the right container (handy if you are setting up [craft-scripts](https://github.com/nystudio107/craft-scripts/) or just want to shell into your project's container later with `ddev ssh` )
2. (Re)Start your DDEV project (a series of networked Docker containers)
3. (Re)Install the container's versions of Composer and npm, together with all their dependencies
4. Instruct Vite to perform a one-time build for production (output in `/web/dist`)
5. Finally, start a Vite dev server for HMR and live reloading


_💡 Run `ddev launch` to open the domain of your Craft project in your default browser. Like all project specific DDEV commands, it can be run from any location below your project's root directory._


Edit the default `index.twig` file in `templates/` to confirm that changes are being pushed to your browser.

Subsequently, you can save some time just running `ddev exec npm run serve` to initiate your Vite dev server. But after a `git pull` or other big changes to the codebase you'll want to re-run `make dev`.

Likewise, to build assets for use in production, stop your Vite server and run `ddev exec npm run build`. But run `make build` periodically or after pulling down major changes.

### Other Useful Development Commands

- `make install` - Runs a complete one-time process to set the project up and install Craft.
- `make up` - Starts the DDEV project, ensuring that SSH keys have been added, and npm & Composer have been installed.
- `make dev` - Runs a one-time build of all front-end assets, then starts Vite's server for HMR and live reloading.
- `make build` - Builds all front-end assets for use in production (defauly location is `/web/dist/`.
- `make composer xxx` - Run Composer commands inside the container, e.g. `make composer install`
- `make craft xxx` - Run Craft commands inside the container, e.g. `make craft project-config/touch`
- `make npm xxx` - Run npm commands inside the container, e.g. `make npm install`
- `make pull` - Pull remote db & assets (requires setting up [craft-scripts](https://github.com/nystudio107/craft-scripts/))


### Useful DDEV Commands
<code>ddev start</code>, <code>ddev stop</code>, <code>ddev restart</code>, <code>ddev import-db</code>, <code>ddev describe</code>, and <code>ddev poweroff</code> are among [the most useful ddev commands](https://ddev.readthedocs.io/en/latest/users/cli-usage/). They can be run from any directory below your project's root directory.


### Included Craft CMS Plugins

[Vite](https://github.com/nystudio107/craft-vite) and [Postmark](https://plugins.craftcms.com/postmark) are the only two plugins currently installed by default. You could edit your `composer.json.default` prior to running `make install` to add or remove plugins to your installation – just remember to mirror those choices in your `Makefile`.

_💡Note that many plugins will require an additional configuration file in your `/config` directory._

### Included Tailwind Plugins

1. [Aspect Ratio](https://github.com/tailwindlabs/tailwindcss-aspect-ratio)
1. [Line Clamp](https://github.com/tailwindlabs/tailwindcss-line-clamp)
1. [Typography](https://github.com/tailwindlabs/tailwindcss-typography)
1. [Forms](https://github.com/tailwindlabs/tailwindcss-forms) (* Beta)

### Included Javascript Libraries

1. [AlpineJS](https://alpinejs.dev/)
1. [Lazysizes](https://afarkas.github.io/lazysizes/)


## Roadmap
- ~~Tailwind 3~~
- ~~Thin out the plugins~~
- ~~Bump php, mariadb + node~~
- ~~Include most useful DDEV commands~~
- Improve default error page layouts
- Option for latest Craft 3 or Craft 4 Beta when it becomes available


## Acknowledgements & Credits

Based on 1DR's excellent [Craft CMS Starter](https://github.com/onedarnleyroad/craftcms). Please read [1DR's credits](https://github.com/onedarnleyroad/craftcms#acknowledgements--credits)!
