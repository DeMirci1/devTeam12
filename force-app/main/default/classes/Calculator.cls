public class Calculator {
    public void welcomeMessage() {
        system.debug('Welcome to Apex Calculator class');
    }
    public void printNewMessage(string msg){
        system.debug(msg);
    }

    public string printAndReturnMsg(string msg2){
        system.debug(msg2);
        string returnStr = msg2 + '.... OK Cool';
        return returnStr;
    }

    public integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }
}
