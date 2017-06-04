const critical = require('critical');
const fs = require('fs');

const STDOUT_FD = 1;
const STDERR_FD = 2;

const options = JSON.parse(process.argv[2]);

critical.generate(options).then(function(criticalCss) {
  if (!options.dest) {
    fs.writeSync(STDOUT_FD, criticalCss);
  }
}).catch(function(err) {
  fs.writeSync(STDERR_FD, err);
  process.exit(1);
});
