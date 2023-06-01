function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
   var appId = '64765b79b5b67772ddcec39f';
   var url = 'https://dummyapi.io/data/v1/'
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    appId: appId,
    url: url,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}