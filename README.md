# bossman-demo

This repository contains configuration data for Akamai properties in Jsonnet format, along with enough configuration to play with Jsonnet and Bossman.

## Story

We are maintaining an Akamai CDN configurations for the `www.bossman-demo.ak.hogg.fr`.
Alongside it, we are maintaining very similar clones of this property for the following domains:

* `integration.bossman-demo.ak.hogg.fr`
* `dev.bossman-demo.ak.hogg.fr`

We are using `jsonnet` to express the configuration template, and `bossman` to deploy changes to the Akamai platform.

## Prerequisites

* **go-jsonnet**

```
brew install go-jsonnet # Mac
apt install go-jsonnet # Debian/Ubuntu
```

On Windows, or if the above don't work, binary releases are available on the GitHub space:

https://github.com/google/go-jsonnet/releases/latest

* **bossman**

```
python3 -m pip install --user bossman
```

Other installation instructions and docs available at https://bossman.readthedocs.io.

* **Akamai EdgeGrid credentials**

If you are with Akamai, you need to create a section called `switcher` in `~/.edgerc` with switchkey-enabled credentials, allowing PAPI Read-Write.
The switch key is already configured in [.bossman](.bossman) and points at the `Advanced Solutions, Services` account.

If you are not with Akamai, this is good for reference purposes but setting it up will require a little bit more work that is not yet documented in this README
(easy enough to figure out, though).

## Simple Walkthrough

These instructions are safe. They interact with test configurations that really exist, but nobody cares about beyond playing with this.

* Clone this repository
* `bossman init` (if you forget, you'll be reminded at a later stage)
* Make a simple change (for example, change the TTL assigned to CSS and JS files in [/templates/www/rules/Offload/CSS-and-Javascript.jsonnet](/templates/www/rules/Offload/CSS-and-Javascript.jsonnet))
* Render the json (`bash render.sh`)
* Stage and commit your changes
* `bossman apply dev1` to deploy the change just to dev1 (you can use a glob pattern, e.g. dev\*, or omit the arg to deploy everywhere)
* `bossman prerelease dev1` to activate on the staging network (ctrl-c twice if you want your terminal back)
* `bossman release dev1` to activate on the production network (ctrl-c twice if you want your terminal back)
* `bossman status` to see the results

This is just scratching the surface. Next you can explore the different pieces.

## Important Files

* `.bossman` contains the `bossman` configuration, how it finds resources to manage essentially
* `env/www/*` contains variable files that provide specific values for `www`, `dev` and `integration`
* `globals.jsonnet` also contains variables that can be shared across scopes; typical examples of global values could be CIDR block lists for well known origins,
  an account and contract id, etc...
* `templates/www.jsonnet` is the main template for generating all the files that constitute an Akamai configuration (hostnames, rules and tests)
  * hint: if you're wondering why all this is one file, it's because `jsonnet -c` can generate multiple files and it's convenient this way; YMMV :)
* `render.sh` loops over the environments and injects the variables into the templates to create valid PAPI JSON
