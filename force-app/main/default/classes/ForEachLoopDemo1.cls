public class ForEachLoopDemo1 {
    public static void iterateIntegerList() {
        List<integer> listInteger = new list<integer>();
        listInteger.add(10);//0 //indexes will always be integer.
        listInteger.add(15);//1
        listInteger.add(21);//2
        listInteger.add(15);//3
        listInteger.add(15);//4
    
        // print each integer one by one
        for (integer eachinteger : listInteger) {
            System.debug(eachinteger);
        }
    }
    public static integer add(list<integer> intList) {
        //temp variBLE to store addition.
        integer returnInt = 0;
        for (integer eachInte : intList) {
            //add eachInte to returnInt.
            System.debug('eachInte --> '+ eachInte);
            returnInt = returnInt + eachInte;
            System.debug('returnInt --> '+ returnInt);
        }

        return returnInt;
    }
}

