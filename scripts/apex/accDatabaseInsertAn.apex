account acc1 = new account();
acc1.Name = 'ABD';
acc1.Industry = 'Energy';

Account acc2 = new Account();
acc2.Name = 'XYZ';

Account acc3 = new Account();
Account acc4 = new Account();

List<Account> listAcc = new List<Account>{acc1, acc2, acc3, acc4};

List<Database.SaveResult> results = Database.insert(listAcc, false);

for (Database.SaveResult r : results) {
    if (r.isSuccess()) {
        System.debug('Records inserted successfully. The record is: ' + r.getId());
    }else {
        System.debug('Errored out. Error is ....'  + r.getErrors());
    }
}