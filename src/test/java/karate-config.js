function fn() {
var env = karate.env; //get system property 'karate.env'
karate.log('karate.env system property was:', env);
karate.configure('headers',{ Accept: 'application/json'});

var casenv = 'qa';

if (!env) {
env = 'sta';
} //default when karate.env not set

var config =
{
  env: env,
  casenv: casenv,
  baseUrl: 'https://gateway-test.u-xer.com',
  account_service_path: '/api/Account',
  addon_service_path: '/api/Addon',
  agent_service_path: '/api/Agent',
  agentBrowserVersion_service_path: '/api/AgentBrowserVersion',
  auth_service_path:'/api/Auth',
  dataPath:'classpath:data/',
  callersPath:'classpath:callers',
  accountId:'/068af038-6cfd-4e24-87e5-bc69005b96b0',
  userId:'bf5bae57-ed66-47e9-b836-6ffa65667f5f',
  agentIdTest1:'25e39feb-f7d4-477c-8dd4-3ee32de6ad79',
  agentIdTest2:'fc282f29-72b8-4b68-8b34-2e6c1bd447d2'


}

karate.log('config.properties =', JSON.stringify(karate.properties));
karate.log('config.env =', config.env);
karate.log('config.baseUrl =', config.baseUrl);
karate.configure('connectTimeout', 6000000);
karate.configure('readTimeout', 6000000);
karate.configure('abortedStepsShouldPass', true); //değiştirilirse rapor hata alıyor.
return config;

}
