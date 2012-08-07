###global escape: true console:true###

#http://jsfiddle.net/estelle/SJjJb/
#http://developer.mozilla.org/en/docs/Whitespace_in_the_DOM
#http://stackoverflow.com/questions/4412469/parsing-css-string-with-regex-in-javascript & http://snipplr.com/view/1529/
#http://stackoverflow.com/questions/3086917/javascript-regex-to-target-and-remove-a-css-rule-from-a-style-tag-based-on-its
class Iconizer
	constructor: (selector, colors) ->
		if colors is null
			colors={}
		head = document.getElementsByTagName('head')[0]
		style = document.createElement('style')
		style.type = 'text/css';
		style.className = 'svg-css-injection'
		svgs = document.querySelectorAll(selector)
		css=''
		svgTxt=''
		s = new XMLSerializer(); 
		for svg in svgs
			id = svg.getAttribute('id')
			css+='.'+id+'{ background-image: url(\'data:image/svg+xml;utf8,'+escape(s.serializeToString(svg.firstChild))+'\') } \n'
			if colors[id]
				items = svg.querySelectorAll('[fill]')
				colrs=colors[id]
				for color in colrs 
					for item in items
						item.setAttribute('fill', color)
					css+='.'+id+'-'+color.substring(1, color.length)+'{ background-image: url(\'data:image/svg+xml;utf8,'+escape(s.serializeToString(svg.firstChild))+'\') } \n'
				
			###Assuming SVG node will be firstChild is precarious unless the SVG writing is machine-generated. Whitespace screws this up.###
		if style.styleSheet
			style.styleSheet.cssText=css
		else 
			style.appendChild(document.createTextNode(css))
		head.appendChild(style)
		
		

		#console.log(styl.innerHTML)
		#str = styl.innerHTML
		#someObject = {}
		#matches = str.match( /^\.(.*?){(.*?)}/ );
		#console.log(matches)
		#someObject[matches[1].replace(/ /g,'')] = matches[2].replace(/ /g,'');

		

		return

	getSVGString: (id) ->
		return

	rewriteRule: (icon, color) ->
		#regex to find old rule

		#edit SVG

		#replace CSS rule with updated CSS
		styl = document.querySelector('.svg-css-injection')
		s = new XMLSerializer(); 
		selector = '.'+icon;
		pattern = new RegExp(selector.replace(/\./g, "\\.") + "\\s*{[^}]*?}", "gim");

		svg = document.querySelector('#'+icon)
		items = svg.querySelectorAll('[fill]')
		for item in items
			item.setAttribute('fill', color)
		css='.'+icon+'{ background-image: url(\'data:image/svg+xml;utf8,'+escape(s.serializeToString(svg.firstChild))+'\') } \n'

		styl.innerHTML=styl.innerHTML.replace(pattern, css);

	refreshRule: (id) ->
		return


###
var str = ".cssRule { value: 'foo'; }";
var someObject = new Object;
var matches = str.match( /^\.(.*?){(.*?)}/ );
someObject[matches[1].replace(/ /g,'')] = matches[2].replace(/ /g,'');
###