## nz-webapps
Web applications repository for [nodezero](https://github.com/nodiscc/nodezero)

#### usage
nz-webapps.ini contains the version/git tag at which the web apps should be.
This repo should be pulled from upstream regularly on the server running nodezero.
When the webapp upgrade check runs, it check whether the local install in apache's documentroot is at an older commit than the latest tag listed here.
If so, it sets the web app status to `upgradeable`.
Tags in nz-webapps.ini have to be manually updated with `git describe --tags $(git rev-list --tags --max-count=1)` in each submodule (which should return the latest tag across all branches).