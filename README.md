sitescrape
==========

Requires an instance of phantomjs running on your server executed via with PATH set to [phantomjs|http://phantomjs.org/]

Given a URL -> return the url as a screenshot via png. Image dimensions will be based off Viewport Width/Height specified in form.

Image will be written to result page where it can be saved or quickly viewed.

Some Uses:

- Easily grab entire site's screenshot without having to paste sections together
- Quick view of different Responsive sizes
- Good start to what could quickly become a thumbnail tool for a site search (google preview style)

TODO: Adding Timeout option for giving sites more time to load

TODO: Decide on correct alternative to storing images rather than current storage to filesystem

TODO: Add ability to scrape entire site and save images as one PDF
