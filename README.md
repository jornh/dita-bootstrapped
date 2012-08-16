dita-bootstrapped
=================

Style your DITA maps and topics with Twitter [Bootstrap](http://twitter.github.com/bootstrap/) for a modern responsive page layout  

An opinionated ongoing experiment on how to avoid building DITA franken-books by not just accepting the default output format often seen of one output page per DITA input topic and letting the poor reader assemble the puzzle by navigating a massive Table of Contents.


## Examples

Built incrementally one user story at a time:

* HelloWorld, a classical minimal example. Output from just one single DITA `task`. This does unfortunately *NOT* illustrate the main point of assembling several DITA topics into more meaningful pages.  Still it demonstrates the **adjustable terseness** feature dita-bootstrapped provides ... and it gets us of the ground ;-)

* *To be continued...*

## How to build your own

1. Clone or download [dita-bootstrapped](https://github.com/jornh/dita-bootstrapped)
2. Install [ditac](http://www.xmlmind.com/ditac/) which requires Java on your machine
3. Run `ditac -t xhtml.xsl comparing-baselines.html comparing-baselines.dita` to build the HelloWorld example
4. Admire `comparing-baselines.html` with your browser - which is the result you just built
