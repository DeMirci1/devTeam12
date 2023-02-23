public with sharing class EmployeeResponse {
    public integer error;
    public string msg;
    Public List<EmployeeWrapper> data;

    public class EmployeeWrapper {
        public string id ;
        public String username;
        public String name;
        public String email;
        public String gender;
        public String designation;
        public String phone_number;
        public String complete_address;
    
    }

}