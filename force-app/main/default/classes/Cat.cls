public class Cat {
    public string name;
    public string color;
    public static integer countCat = 0;

    public Cat() {
        System.debug('Cat constructor called.');
        countCat++;

    }
    public Cat(string n, string clr) {
        name = n;
        color = clr;
        countCat++;
        sleeping();
    }

    public void sleeping(){
    System.debug(name + ' is sleeping');
    }
}
