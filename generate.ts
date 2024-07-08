import * as fs from 'fs';
import * as path from 'path';

function readDirectory(dir: string): { filePath: string; lastModified: Date }[] {
    let results: { filePath: string; lastModified: Date }[] = [];
    let list = fs.readdirSync(dir);
    list.forEach((file) => {
        let filePath = path.join(dir, file);
        let stat = fs.statSync(filePath);
        if (stat && stat.isDirectory()) {
            results = results.concat(readDirectory(filePath));
        } else if (filePath.endsWith('.pdf')) {
            results.push({ filePath, lastModified: stat.mtime });
        }
    });
    return results;
}

const pdfPath = process.argv[2];
const pdfFiles = readDirectory(pdfPath);
const templateFile = process.argv[3];
const pdfLinks = pdfFiles.map(file =>
    `<tr><td><a href="${file.filePath}">${file.filePath}</a></td><td>${file.lastModified.toLocaleString()}</td></tr>`
).join('\n');
const index = fs.readFileSync(templateFile, 'utf-8').replace('{{pdfLinks}}', pdfLinks);
const outputPath = path.join(pdfPath, 'index.html');
fs.writeFileSync(outputPath, index);
