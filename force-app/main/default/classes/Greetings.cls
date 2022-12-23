public class Greetings {
    public string language = '';
    public string greetHello() { 
        string greet = '';
        if (language == 'Hindi'){ 
        greet = 'Namaste';            
        }else if (language == 'Turkish') {
            greet = 'Merhaba';            
        }else if (language == 'Russian') {
            greet = 'Privet';            
        }else {
            greet = 'Hello';
        }
        return greet;
    }
    public string greetHellos() {
        string greet = '';
        switch on language {
            when 'Hindi' {
                greet = 'Namaste, Namaste';
            }when 'English' {
                greet = 'Hello, Hello';
            }when 'Russian' {
                greet = 'Privet, Privet';
            }
            when else {
                greet = 'Merhaba, Merhaba';
            }
        }
        return greet;
    }
    public string greetHello(integer n) { 
        string greet = '';
        if (language == 'Hindi'){ 
        greet = 'Namaste';            
        }else if (language == 'Turkish') {
            greet = 'Merhaba';            
        }else if (language == 'Russian') {
            greet = 'Privet';            
        }else {
            greet = 'Hello';
        }
        string finalReturnString = greet;
        for (Integer i = 1; i < n; i++) {
            finalReturnString = finalReturnString + ' ' + greet;
        }
        return finalReturnString;
    }
    
}
