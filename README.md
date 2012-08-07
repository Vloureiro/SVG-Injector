Advantages

General
* Embedded SVG can be page-specific (only add the SVG you need)
* One less request 
* SVG is editable 
* Small and FAST

From SVG CSS backgrounds (file reference)
* No file requests
* SVG can be altered at runtime

From SVG CSS background (data URI)
* No bloating of CSS file with data URIs that aren't being used for a page
* SVG can be altered at runtime

From font-embedding
* In most cases, considerably smaller footprint
* More precise control of vector positioning and sizing


Disadvantages
* Relies on Javascript
* Bloats HTML, adds semantically irrelevant markup
* Large SVG files could choke the system