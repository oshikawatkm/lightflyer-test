const program = require('commander');
const info = require('../commands/info');

program
  .command('balances')
  .description('GET wallet balance')
  .action(info.get_all_walletbalances);

program
  .command('addresses')
  .description('GET addresses')
  .action(info.get_all_addresses);

program.parse(process.argv);

// If no args, output help
if (!process.argv[2]) {
  program.outputHelp();
}