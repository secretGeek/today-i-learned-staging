# Css Properties of Current Page

This table shows all of the css properties embedded in this site's stylesheet, their purpose, and their current value. It also demonstrates their effect by styling the current row accordingly.

<div id='allstyles'>&nbsp;</div>

<script>

function htmlToElement(html) {
	var template = document.createElement("template");
	html = html.trim(); // Never return a text node of whitespace as the result
	template.innerHTML = html;
	return template.content.firstChild;
}

// could pass in an array of specific stylesheets for optimization
function getAllCssPropertyNames(styleSheets = document.styleSheets){
	 let cssProps = [];
	 // loop each stylesheet
	 for(let i = 0; i < styleSheets.length; i++){
			// loop stylesheet's cssRules
			try{ // try/catch used because 'hasOwnProperty' doesn't work
				 for(let j = 0; j < styleSheets[i].cssRules.length; j++){
						try{
							 // loop stylesheet's cssRules' style (property names)
							 for(let k = 0; k < styleSheets[i].cssRules[j].style.length; k++){
									let name = styleSheets[i].cssRules[j].style[k];
									// test name for css property signature and uniqueness
									if(name.startsWith('--') && cssProps.indexOf(name) == -1){
										 cssProps.push(name);
									}
							 }
						} catch (error) {}
				 }
			} catch (error) {}
	 }
	 return cssProps;
}

function getCssPropertyInfo(properties = []) {
	result = [];
	//if (properties == null) return result;

	for(let v of properties){
		let value = getComputedStyle(document.documentElement).getPropertyValue(v);
		if (v.indexOf('-width') >= 0) {
			purpose = 'width';
			style = `width: var(${v});`;
		} else if (v.indexOf('-shadow') >= 0) {
			purpose = 'shadow';
			style = `box-shadow: 0 0 5px var(${v});`;
		} else if (v.indexOf('-bg') >= 0) {
			purpose = 'background';
			style = `background-color: var(${v}); color:white;`;
		} else {
			purpose = 'color';
			style = `color: var(${v});`;
		}

		result.push({ property: v, purpose: purpose, value: value, style: style});
	}

	return result;
}

function showStyles(targetElementId = "allstyles") {
	let propertyInfo = getCssPropertyInfo(getAllCssPropertyNames());
	let result = '<table><thead><tr><th>property</th><th>purpose</th><th>value</th></tr></thead>\n<tbody>\n';
	for(let p of propertyInfo){
		result += `<tr style='${p.style}'><td>${p.property}</td><td>${p.purpose}</td><td>${p.value}</td></span></tr>\n`;
	}
	result += '</tbody>\n</table>\n';
	var slot = document.getElementById(targetElementId);
	const list = htmlToElement(result);
	slot.appendChild(list);
}

showStyles();
</script>

To get the properties it loops through all style names like this:

	document.styleSheets[i].cssRules[j].style[k]

Looking for any style that starts with: "--";

To find the value of a css property, it uses, for example:

	getComputedStyle(document.documentElement).getPropertyValue("--link");

To determine the 'purpose' of a style, it makes assumptions based on the property naming convention I seem to follow:

- Like '-width'? It's a width.
- Like '-shadow'? It's a shadow color.
- Like '-bg'? It's a background color
- Otherwise: it's a color.

## See also

- [How to implement dark mode with css](dark_mode_css.md)
- [Replace Text with Property Values](replace_text_with_property_values.md)
