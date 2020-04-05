const exec = require('child_process').exec;

const info = {
  async get_all_walletbalances(cmd) {
    child = exec('. ../shells/get_all_walletbalance.sh', function(error) {
      // Resolve with result of process
      context.done(error, 'Process complete!');
    });
    child.stdout.on('data', console.log);
    child.stderr.on('data', console.error);
  },
  async get_all_addresses(cmd) {
    chikd = exec('. ../shells/get_all_address.sh', function(error) {
      // Resolve with result of process
      context.done(error, 'Process complete!');
    });
    child.stdout.on('data', console.log);
    child.stderr.on('data', console.error);
  },
}

module.exports = info;