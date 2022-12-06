public  class SetDemo {
    public static void citySet() {
        Set<string> cities = new Set<string>();
        cities.add('Tokyo');
        cities.add('Atlanta');
        cities.add('Las Vegas');
        cities.add('Istanbul');
        cities.add('Astana');
        cities.add('Berlin');
        cities.add('TOKYO');
        cities.add('Tokyo');
        cities.add('Astana');
        cities.add('Las Vegas');

        System.debug('CITIES ARE ' + cities);

    }
    public static void randomIntegerSet() {
        Set<integer> integerSet = new Set<integer>();
        integerSet.add(10);
        integerSet.add(15);
        integerSet.add(21);
        integerSet.add(15);
        integerSet.add(15);
        System.debug('integer set is '+ integerSet);
    }


    public static Set<integer> setFromList (List<integer> intList) {
        Set<integer> setInt = new Set<integer>();
        setInt.addAll(intList);
        return setInt;
    }
    public static set<string> uppercaseSet(set<string> setStr) {
    Set<String> returnSet = new Set<String>();
        
    for (string eachString : setStr) {
    string tempStr = eachString.toUpperCase();
    returnSet.add(tempStr);
    }
    return returnSet;
        
    }
}
