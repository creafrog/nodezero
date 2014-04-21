# Static site generators

Backstory: I decided to [crowdsource static site generator recommendations](https://twitter.com/davatron5000/status/185808909657841664), so the following are actual real world suggested-to-me results. I then took those and sorted them by language/server and, just for a decent relative metric, their Github Watcher count. If you want a heap of other projects (including other languages like Haskell and Python) Nanoc has the [mother of all site generator lists](http://nanoc.stoneship.org/docs/1-introduction/#similar-projects). If you recommend another one, by all means add a comment.

## Ruby

* [Jekyll](https://github.com/mojombo/jekyll) 8,221 :octocat:
* [Octopress](http://octopress.org/) 4,512 :octocat:
* [Middleman](https://github.com/middleman/middleman) 2,282 :octocat:
* [Middleman](http://middlemanapp.com/) 1,261 :octocat:
* [toto](http://cloudhead.io/toto) 1,221 :octocat:
* [NestaCMS](http://nestacms.com/) 745 :octocat:
* [Statis](http://stasis.me/) 613 :octocat:
* [Nanoc](https://github.com/nanoc/nanoc) 486 :octocat:
* [Frank](https://github.com/blahed/frank) 364 :octocat:
* [Ruhoh](http://ruhoh.com/) 267 :octocat:
* [StaticMatic](http://www.staticmatic.net/) 247 :octocat:
* [Bonsai](https://github.com/benschwarz/bonsai) 214 :octocat:
* [Serif](https://github.com/aprescott/serif) 91 :octocat:
* [Korma](https://github.com/sandal/korma) 75 :octocat:
* [Dynamicmatic](https://github.com/nex3/dynamicmatic) 45 :octocat:
* [webgen](http://webgen.rubyforge.org/) 42 :octocat:
* [Hobix](https://github.com/hobix/hobix) 6 :octocat:

## Node.JS

* [DocPad](https://github.com/bevry/docpad) 839 :octocat:
* [hexo](http://zespia.tw/hexo/) 797 :octocat:
* [Punch](http://laktek.github.com/punch/) 519 :octocat:
* [Assemble](https://github.com/assemble/assemble/) :379: octocat
* [Wintersmith](https://github.com/jnordberg/wintersmith) 310 :octocat:
* [Blacksmith](https://github.com/flatiron/blacksmith) 232 :octocat:
* [Romulus](https://github.com/felixge/node-romulus) 106 :octocat:
* [Cabin](https://github.com/CabinJS/Cabin) 86 :octocat:
* [Keroua](https://github.com/jaredhanson/kerouac) 48 :octocat:
* [Quill](http://justquillin.com/) 35 :octocat:

## PHP

* [Stacey](https://github.com/kolber/stacey) 790 :octocat:
* [Second Crack](https://github.com/marcoarment/secondcrack) 692 :octocat:
* [Stacey](http://staceyapp.com/) 624 :octocat:
* [Kirby](http://getkirby.com/) 323 :octocat: :moneybag:
* [PieCrust](http://bolt80.com/piecrust) 73 :octocat:
* [Sculpin](https://sculpin.io/) 64 :octocat:

## Python
* [Pelican](https://github.com/getpelican/pelican) 2,258 :octocat:
* [Jinja](https://github.com/mitsuhiko/jinja2) 1,255 :octocat:
* [Hyde](https://github.com/lakshmivyas/hyde) 855 :octocat:
* [Nikola](https://github.com/ralsina/nikola) 312 :octocat:
* [Blogofile](https://github.com/EnigmaCurry/blogofile) 280 :octocat:
* [Markdoc](https://github.com/zacharyvoase/markdoc) 162 :octocat:
* [Ikiwiki](https://github.com/joeyh/ikiwiki) 112 :octocat:
* [Chisel](https://github.com/dz/chisel) 51 :octocat:
* [Pyll](https://github.com/arthurk/pyll) 26 :octocat:
* [Blatter](https://github.com/bbinet/blatter) 2 :octocat:

## Perl
* [Movable Type](http://movabletype.org) 206 :octocat:

## Java
* [JBake](https://github.com/jonbullock/JBake) 12 :octocat:

##Shell
 * [Fugitive](https://gitorious.org/fugitive)

##External Links
* [Static Site Generators](http://staticsitegenerators.net/) - The definitive listing of Static Site Generators 
* [Staticgen](http://staticgen.com/) - Dynamic list of top-trending static site generators


##Todo
* Add site generators that are not on github (how do we measure popularity?)
* Do a search for "static site generator on github" and include most popular repositories
* Add projects from https://iwantmyname.com/blog/2011/02/list-static-website-generators.html
* Add projects from http://www.webhostingbillboards.com/development/10-powerful-free-static-website-generators/
* Add projects from https://gist.github.com/max-arnold/6402386
* Add more.
* Move the list to a plain git repo so that everyone can do pull requests OR
 * Add missing generators to https://github.com/jaspervdj/static-site-generator-comparison (it may be a good definitive list)

    LIST=`grep "\* \[" static-sites-generators/gistfile1.md | cut --complement -b 1-3 | awk -F "]" '{print $1}'`
    echo "$LIST"|while read i; do if [[ ! `grep "$i" static-site-generator-comparison/list.yaml` ]] ; then echo "$i not found"; fi; done
