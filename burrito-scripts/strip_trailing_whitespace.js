function process(input) {
	return input.split('\n').map(function(s) { return s.replace(/\s+$/, ""); }).join('\n');
}
