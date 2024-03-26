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
  scenario_service_path: '/api/Scenario',
  agentBrowserVersion_service_path: '/api/AgentBrowserVersion',
  auth_service_path:'/api/Auth',
  project_service_path:'/api/Project',
  step_service_path:'api/Step',
  dataPath:'classpath:data/',
  callersPath:'classpath:callers',
  accountId:'068af038-6cfd-4e24-87e5-bc69005b96b0',
  projectIdTest1:'6e3eedc8-ebeb-4ca1-8f2e-1dcc9135e4a7',
  projectIdTest2:'134acae7-a4a1-4710-81fe-12816a4e8d2c',
  userId:'bf5bae57-ed66-47e9-b836-6ffa65667f5f',
  agentIdTest1:'25e39feb-f7d4-477c-8dd4-3ee32de6ad79',
  agentIdTest2:'fc282f29-72b8-4b68-8b34-2e6c1bd447d2',
  scenarioIdTest1:'ed9b3936-2894-478a-9733-4c8bfc3d68ad',
  scenarioIdTest2:'7b137ae5-2ebf-4440-8246-5c31ceef0808',
  scenarioIdTest3:'d8e3aa7b-2ec3-47f2-9630-560438444a08',
  folderIdTest1:'d099e523-f581-463c-a579-81f347ac5d32',
  stepIdTest1:'a2f06500-b7c2-4a4f-8972-bce8f9982ea8',
  stepIdTest2:'5ec03624-b6ab-4e9d-be55-cebc97acc235'

}

karate.log('config.properties =', JSON.stringify(karate.properties));
karate.log('config.env =', config.env);
karate.log('config.baseUrl =', config.baseUrl);
karate.configure('connectTimeout', 6000000);
karate.configure('readTimeout', 6000000);
karate.configure('abortedStepsShouldPass', true); //değiştirilirse rapor hata alıyor.
return config;

}
