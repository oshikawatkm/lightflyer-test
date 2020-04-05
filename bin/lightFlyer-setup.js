const program = require('commander');
const setup = require('../commands/setup');

program
  .command('start')
  .description('start default nodes')
  .action(setup.start_defaultnodes);

program.parse(process.argv);


if (!process.argv[2]) {
  program.outputHelp();
}