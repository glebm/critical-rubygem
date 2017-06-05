// Supports node v0.12+.

const critical = require('critical');
const fs = require('fs');

const STDOUT_FD = 1;
const STDERR_FD = 2;

function hydrateRegexps(opts) {
  if (Array.isArray(opts)) {
    return opts.map(hydrateRegexps);
  } else if (typeof opts === 'object') {
    const keys = Object.keys(opts);
    if (keys.length === 1 && keys[0] === 'RegExp') {
      const val = opts[keys[0]];
      return Array.isArray(val) ? new RegExp(val[0], val[1]) : new RegExp(val);
    }
    keys.forEach(function(key) {
      opts[key] = hydrateRegexps(opts[key]);
    });
  }
  return opts;
}

if (!Array.isArray) {
  Array.isArray = function(arg) {
    return Object.prototype.toString.call(arg) === '[object Array]';
  };
}

const options = hydrateRegexps(JSON.parse(process.argv[2]));

critical.generate(options).then(function(criticalCss) {
  if (!options.dest) {
    fs.writeSync(STDOUT_FD, criticalCss);
  }
}).catch(function(err) {
  fs.writeSync(STDERR_FD, err);
  process.exit(1);
});
