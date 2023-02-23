public with sharing class RestCallouts {
    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: GET
    public static HttpResponse getAnimals() {

        //1. prepeare HTTPREQUEST and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals'); 
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send thr HttpRequest over the internet in order to receive HttpRequest back 
        HttpResponse response = http.send(request);

        //4. Process HttpRequest
        System.debug(response.getStatusCode());
        System.debug(response.getBody());

        return response;
    }
    //Endpoint: https://api.instantwebtools.net/v1/airlines
    //Http Method: GET
    public static HttpResponse getAirlines() {

        //1. prepeare HTTPREQUEST and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines'); 
        request.setMethod('GET');

        //2. Prepare INTERNET
        Http http = new Http();

        //3. Send thr HTTPRESPOND over the internet in order to receive HttpRequest back
        HttpResponse response = http.send(request);

        //4. Process HttpRequest
        if (response.getStatusCode() ==200) {
            string jsonResponse = response.getBody();
            //Convert the response body into list of airlines__c    
            List<AirlineWrapper> wrapper = (List<AirlineWrapper>)JSON.deserialize(jsonResponse, List<AirlineWrapper>.class);
            //Convert the wrapper
            List<Airline__c> airlines = new List<Airline__c>();  
            for (AirlineWrapper aw : wrapper) {
                if (aw.id != null && aw.id.length() < 3) {
                    Airline__c airline = new Airline__c();
                    Airline.Name = String.valueOf(aw.id);
                    Airline.country__c = aw.country;
                    Airline.Established__c = aw.established;
                    Airline.Head_Quarters__c = aw.head_quaters;
                    Airline.Logo_URL__c = aw.logo;
                    Airline.Name__c = aw.name;
                    Airline.Slogan__c = aw.slogan;
                    Airline.Website__c = aw.website;
                    airlines.add(airline);
                }
                
            }
            try {
                insert airlines;
            } catch (Exception ex) {
                System.debug(ex.getMessage());
            }

            
        }
        return Response;
    }
     //Endpoint: https://api.onlinewebtutorblog.com/employees
    //Http Method: GET
    public static HttpResponse getEmployees() {
         //1. prepeare HTTPREQUEST and wrap all the necessary data in it
         HttpRequest request = new HttpRequest();
         request.setEndpoint('https://api.onlinewebtutorblog.com/employees'); 
         request.setMethod('GET');
 
         //2. Prepare internet
         Http http = new Http();
 
         //3. Send thr HttpRequest over the internet in order to receive HttpRequest back 
         HttpResponse response = http.send(request);
 
         //4. Process HttpRequest
         if (response.getStatusCode() ==200) {
            string jsonString = response.getBody();
            //Convert the jsonstring into Employee Response Class
            EmployeeResponse empRes = (EmployeeResponse)JSON.deserialize(jsonString, EmployeeResponse.class);
            List<EmployeeResponse.Employeewrapper> wrappers = empRes.data;
            //Convert each EmployeeWrapper into Employee__c sObject 
            List<Employee__c> employees = new List<Employee__c>();
            for(EmployeeResponse.Employeewrapper wrap : wrappers) {
                Employee__c emp = new Employee__c();
                emp.Name = String.valueOf(wrap.id);
                emp.username__c = wrap.username;
                emp.employee_name__c = wrap.name;
                emp.email__c = wrap.email;
                emp.gender__c = wrap.gender;
                emp.designation__c = wrap.designation;
                emp.phone_number__c = wrap.phone_number;
                emp.complete_address__c = wrap.complete_address;
                employees.add(emp);
            }
            try {
                insert employees;
            } catch (Exception ex) {
                System.debug(ex.getMessage());
            }
        }    
        return response;
    }
    //Endpoint: https://demirci-d-dev-ed.develop.my.salesforce.com/services/apexrest/Cases/003B000000MjRoSIAV
    //Http Method: GET
    public static HttpResponse getCasesUsingNC() {
        //1. prepeare HTTPREQUEST and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:BATCH12/services/apexrest/Cases/003B000000MjRoSIAV');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send thr HttpRequest over the internet in order to receive HttpRequest back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        System.debug(response.getStatusCode());
        System.debug(response.getStatus());
        System.debug(response.getBody());
        return response;
    }
    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: POST
    public static HttpResponse postAnimal() {
        //1. prepeare HTTPREQUEST and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        
        string body = '{"name":"mighty moose"}';
        request.setBody(body);
        request.setHeader('Content-Type', 'Application/json;Charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();

        //3. Send thr HttpRequest over the internet in order to receive HttpRequest back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        if (response.getStatusCode() == 201) {
            System.debug('Request has been processed successfully');
            
        }else {
            System.debug('Something went wrong while creating animal information' + response.getBody());
        }
        return response;

    }
}