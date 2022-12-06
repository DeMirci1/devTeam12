ListDemo.allCats();

string value2 = ListDemo.candidateList(2);
system.debug(value2);

string value3 = ListDemo.candidateList(3);
system.debug(value3);

string value33 = ListDemo.candidateList(-3);
system.debug(value33);

ListDemo.candidateList();
ListDemo.randomIntegerList();


List<integer> listInteger  = new List<integer>();
listInteger.add(10);
listInteger.add(35);
listInteger.add(21);
listInteger.add(15);
listInteger.add(24);
system.debug('Before sort '+ listInteger);
listInteger.sort();
system.debug('after sort '+ listInteger);

