SetDemo.citySet();
SetDemo.randomIntegerSet();

List<integer> listInteger = new List<integer>();
listInteger.add(10);
listInteger.add(15);
listInteger.add(21);
listInteger.add(15);
listInteger.add(15);
set<integer> setInteger = SetDemo.setFromList(listInteger);
system.debug('Set -> '+ setInteger);

set<string> cities = new set<string>();
cities.add('Tokyo');
cities.add('Lisbon');
cities.add('Nairobi');
cities.add('Berlin');
cities.add('Berlin');
cities.add('Nairobi');
cities.add('Tokyo');
cities.add('TOKYO');
set<string> uppercaseCities = SetDemo.uppercaseSet(cities);
system.debug(uppercaseCities);