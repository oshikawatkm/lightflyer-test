const exec = require('child_process').exec;

async function start_defaultnodes() {
  exec('source /Users/oshikawa/Desktop/light-flyer/shells/default_network.sh', function(err, stdout, stderr) {
    if (err) {
      console.error(`exec error: ${err}`);
      return;
    }
  
    console.log(`stdout: ${stdout}`);
    console.log(`stderr: ${stderr}`);
  })
}

start_defaultnodes()