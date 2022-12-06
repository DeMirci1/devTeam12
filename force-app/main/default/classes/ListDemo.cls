public class ListDemo {
    public static string candidateList(integer i) {
        List<string> listCandidates = new List<string>();
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Jeff');
        listCandidates.add('Marc');
        System.debug('List of candidates ' + listCandidates);
        string returnString = listCandidates[i];
        integer sizeOfList = listCandidates.size();

        if(i >= 0 && i < sizeOfList){
            returnString = listCandidates[i];
        } else {
            returnString = 'No values found. stay in limits';
        }
        return returnString;
    }
    public static void randomIntegerList() {
        List<integer> listInteger  = new List<integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);
        
        integer valueAt3Index = listInteger.get(3);
        //or
        integer valueAt3Index2 = listInteger[3];
        
        System.debug('Random integer list is '+ listInteger);
        System.debug('value at index 3 is '+ valueAt3Index);
    }
    public static void allCats() {
        List<cat> listCat = new List<cat>();
        
        cat falconsCat = new cat ('Luna', 'Black');
        cat falconsCat1 = new cat ('Cloudy', 'Brown');
        cat falconsCat2 = new cat ('Mercan', 'White');
        listCat.add(falconsCat);
        listCat.add(falconsCat1);
        listCat.add(falconsCat2);
        listCat.add(falconsCat);
        System.debug('List of cats ' + listCat);
    }
        
}