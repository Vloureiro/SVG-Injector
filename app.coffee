window.onload = ->
	new Iconizer('#prefix-svg-container .iconic', {'icon-ampersand':'#00ff00', 'icon-x':'#0000ff'})

class Iconizer
	constructor: (selector, colors={}) ->
		date1 = new Date()
		milliseconds1 = date1.getTime()
		
		head = document.getElementsByTagName('head')[0]
		style = document.createElement('style')
		style.type = 'text/css';
		svgs = document.querySelectorAll(selector)
		css=''
		svgTxt=''
		s = new XMLSerializer(); 
		n=0
		for svg in svgs
			id = svg.getAttribute('id')
			if(colors[id])
				items = svg.querySelectorAll('[fill]')
				for item in items
					item.setAttribute('fill', colors[id])
			css+='.'+id+'{ background-image: url(\'data:image/svg+xml;utf8,'+escape(s.serializeToString(svg.firstChild))+'\') } '
			n++
		if style.styleSheet
			style.styleSheet.cssText=css
		else 
			style.appendChild(document.createTextNode(css))
		head.appendChild(style)
		
		date2 = new Date()
		milliseconds2 = date2.getTime()
		diff=date2-date1
		console.log(diff, n)
