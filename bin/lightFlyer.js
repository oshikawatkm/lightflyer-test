#!/usr/bin/env node
const program = require('commander');
const pkg = require('../package.json');

program
  .version(pkg.version)
  .command('setup', 'Manage API Key -- https://nomics.com')
  .command('info', 'Check Coin Price Info')
  .parse(process.argv);