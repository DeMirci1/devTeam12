try {
    string s;
    s.toLowerCase();
    account ac = new account();
    insert ac;
} catch (DmlException dex) {
    System.debug('DML went wrong buddy');
}
catch (Exception ex) {
    System.debug('Something went wrong buddy');

    System.debug('Exception message: ' + ex.getMessage());

    System.debug('ex line  number: ' + ex.getLineNumber());
}
System.debug('Apex is simple');