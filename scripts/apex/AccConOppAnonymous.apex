AccConAndOppOperations.sumOpp();
AccConAndOppOperations.sumOpp2();
list<account> listAccount = [select id, from account where createdate = THIS_WEEK];
delete listAccount;
list<account> listAccount = [select id, from account where createddate = THIS_WEEK];
delete listAccount;