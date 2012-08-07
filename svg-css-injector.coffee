###global escape: true###

#http://jsfiddle.net/estelle/SJjJb/
class Iconizer
	constructor: (selector, colors) ->
		if colors is null
			colors={}
		
		head = document.getElementsByTagName('head')[0]
		style = document.createElement('style')
		style.type = 'text/css';
		svgs = document.querySelectorAll(selector)
		css=''
		svgTxt=''
		s = new XMLSerializer(); 
		for svg in svgs
			id = svg.getAttribute('id')
			if(colors[id])
				items = svg.querySelectorAll('[fill]')
				for item in items
					item.setAttribute('fill', colors[id])
			css+='.'+id+'{ background-image: url(\'data:image/svg+xml;utf8,'+escape(s.serializeToString(svg.firstChild))+'\') } '
		if style.styleSheet
			style.styleSheet.cssText=css
		else 
			style.appendChild(document.createTextNode(css))
		head.appendChild(style)
		
		
		return

	getSVGString: (id) ->
		return

	rewriteRule: () ->
		#regex to find old rule

		#edit SVG

		#replace CSS rule with updated CSS

	refreshRule: (id) ->
		return
