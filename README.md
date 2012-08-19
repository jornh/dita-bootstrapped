dita-bootstrapped
=================
Style your DITA maps and topics with Twitter [Bootstrap](http://twitter.github.com/bootstrap/) for a modern responsive page layout that tries to be readable even on a widescreen display.

## What is DITA-Bootstrapped - and why was it built?

DITA-Bootstrapped is an *opinionated ongoing experiment* on how to avoid building DITA franken-books by not just accepting the default output format often seen of one output page per DITA input topic and letting the poor reader assemble the puzzle by navigating a massive Table of Contents.


## Examples

Built incrementally one user story at a time:

* [HelloWorld](http://jornh.github.com/dita-bootstrapped/comparing-baselines.html), a classical minimal example. Output from just one single DITA `task`. This does unfortunately *NOT* illustrate the main point of assembling several DITA topics into more meaningful pages.  Still it demonstrates the **adjustable terseness** feature dita-bootstrapped provides ... and it gets us of the ground ;-)

* *Emergent ;-)* Recipe for stepwise refactoring [existing](http://www.xmlmind.com/tutorials/DITA/index.html) DITA [sources](http://www.xmlmind.com/tutorials/DITA/src/tutorial.ditamap) to get them *Bootstrap-ified* by: 1) Tweak the `.ditamap` to chunk the 22 pages into just [5 pages]() 2) **TODO**: breaking up `section`s etc. in big files, 3) **TODO**: adding `shortdesc` based progressive disclosure for findability

* *To be continued...* but you can participate by adding or fixing issues, or just comment on the existing issues to have your say on what's important or even fork this thing and scratch your own itches

## How to build your own

1. Clone or download [dita-bootstrapped](https://github.com/jornh/dita-bootstrapped)
2. Install [ditac](http://www.xmlmind.com/ditac/) which requires Java on your machine
3. Run `ditac -t xhtml.xsl out/comparing-baselines.html comparing-baselines.dita` to build the HelloWorld example
4. Admire `out/comparing-baselines.html` with your browser - which is the result you just built
