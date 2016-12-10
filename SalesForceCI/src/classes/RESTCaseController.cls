@RestResource(urlMapping='/FieldCase/*')
global with sharing class RESTCaseController {

@HttpPost   
  global static String createNewCase() {
     return 'Submitted case';
  }
  
@HttpGet
  global static String getOpenCases() {
    return 'First Case';    
  }
}