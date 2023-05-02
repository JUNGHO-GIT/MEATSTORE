const uncss = require('uncss');
const glob = require('glob');
const fs = require('fs');


const cssFile = 'src/main/webapp/res/css/main.css';
const outputCssFile = 'src/main/webapp/res/css/optimized.css';
const ctxpathRegex = /\$\{ctxpath\}/g;
const projectRoot = 'C:/JUNGHO/2.IDE/2.Vscode/Workspace/1.Project/MeatStore';
const replacementPath = projectRoot + '/src/main/webapp/res';


glob('src/main/webapp/**/*.jsp', {}, (err, files) => {
	if (err) {
		console.error('Error finding JSP files:', err);
		return;
	}
	const fileContents = files.map((file) => {
		const content = fs.readFileSync(file, 'utf8');
		return {
			file,
			originalContent: content,
			modifiedContent: content.replace(ctxpathRegex, replacementPath),
		};
	});
	const modifiedFiles = fileContents.map(({ file, modifiedContent }) => {
		fs.writeFileSync(file, modifiedContent, 'utf8');
		return file;
	});
	uncss(modifiedFiles, { raw: fs.readFileSync(cssFile, 'utf8') }, (err, output) => {
		if (err) {
			console.error('Error running UNCSS:', err);
			return;
		}
		fs.writeFile(outputCssFile, output, (err) => {
			if (err) {
				console.error('Error writing optimized CSS file:', err);
				return;
			}
			console.log('Optimized CSS written to', outputCssFile);
		});
		fileContents.forEach(({ file, originalContent }) => {
			fs.writeFileSync(file, originalContent, 'utf8');
		});
	});
});