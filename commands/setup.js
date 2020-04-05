const exec = require('child_process').exec;


const setup = {
  async start_defaultnodes(cmd) {
    child = exec('. ../shells/default_network.sh', function(error) {
      // Resolve with result of process
      context.done(error, 'Process complete!');
    });
    child.stdout.on('data', console.log);
    child.stderr.on('data', console.error);
  }
}

module.exports = setup;