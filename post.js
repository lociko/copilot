const { spawn } = require('child_process');
const path = require('path');

const scriptPath = path.join(__dirname, 'post.sh');
const child = spawn('bash', [scriptPath], {
  stdio: 'inherit',
  shell: true
});

child.on('error', (error) => {
  console.error(`Error: ${error.message}`);
  process.exit(1);
});

child.on('exit', (code) => {
  process.exit(code);
});