//JSON means JAVASCRIPT OBJECT NOTATION

//Single record WE USE {}
{
    "Name" : "Adam",
    "Age" : 45,
    "Title" : "Developer",
    "Salary" : 300.44,
}

// WE USE [{},{}] FOR MULTIPLE JSON format
[
    {
        "Name" : "Adam",
        "Age" : 45,
        "Title" : "Developer",
        "Salary" : 300.44,
    },
    {
        "Name" : "Adam",
        "Age" : 45,
        "Title" : "Developer",
        "Salary" : 300.44,
    }
]

//Get an account record 
List<Contact> acc = [SELECT id, Name, Birthdate, Phone FROM contact LIMIT 4];
string jsonFormat = JSON.serialize(acc);
System.debug(jsonFormat);

//Callouts TEST
RestCallouts.getAnimals();
RestCallouts.getAirlines();
RestCallouts.getEmployees();
RestCallouts.getCasesUsingNC();
RestCallouts.postAnimal();

SoapCallouts.parksCallout('United States');
SoapCallouts.doAddCalloout(8,7);
SoapCallouts.doMultiplyCallout(8,8);
//solution design
1. Flow