file=$1
node -p "JSON.parse(
	require('fs').readFileSync(process.argv[1]).toString()
).extensions.join('\n')" "$file" | sort | uniq > "$file.sorted"
node -p "arr = require('fs').readFileSync(process.argv[1]).toString().split('\n').filter(s => s.length > 0);
JSON.stringify({extensions: arr}, null, '\t').replace(': [', ':\n\t[')" "$file.sorted" > "$file"
rm "$file.sorted"
