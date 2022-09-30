# bossman-demo

This repository contains configuration data for Akamai properties in Jsonnet format, along with enough configuration to play with Jsonnet and Bossman.

## Story

We are maintaining an Akamai CDN configurations for the `www.bossman-demo.ak.hogg.fr`.
Alongside it, we are maintaining very similar clones of this property for the following domains:

* `integration.bossman-demo.ak.hogg.fr`
* `dev.bossman-demo.ak.hogg.fr`

Additionally, we are maintaining redirects as code via the Akamai Edge Redirector cloudlet.

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

For an introduction to Akamai EdgeGrid, please refer to https://techdocs.akamai.com/developer/docs/authenticate-with-edgegrid.

To use this demo:

* Provision credentials with READ/WRITE access to PAPI and Cloudlets v3.
* Put them in a `bossman-demo` section within your `.edgerc` file
* 

> If you are with Akamai, you can add an account switch key and pointing at the `Advanced Solutions, Services` account:
>
> ```
> [bossman-demo]
> client_secret = xxxx
> host = xxxx
> access_token = xxxx
> client_token = xxxx
> account_key = B-C-1ED34DK:1-8BYUX
> ```
>
> This will allow you to use the actual configurations managed by this demo without any other changes.

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
* `templates/cloudlets.jsonnet` is the main template for generating all the files that constitute an Akamai Cloudlet policy configuration
* `render.sh` loops over the environments and injects the variables into the templates to create valid PAPI JSON
