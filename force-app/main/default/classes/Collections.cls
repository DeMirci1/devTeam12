public class Collections {
    public static string listAssignment (integer m) {
        List<string > LstMonth  = new List<string >();
        string output_month = '';
        LstMonth.add('January');
        LstMonth.add('February');
        LstMonth.add('March');
        LstMonth.add('April');
        LstMonth.add('May');
        LstMonth.add('June');
        LstMonth.add('July');
        LstMonth.add('August');
        LstMonth.add('September');
        LstMonth.add('October');
        LstMonth.add('November');
        LstMonth.add('December');
        if (m>=lstMonth.size()) {
            System.debug('Not a valid month.');
        } else {
            output_month = lstMonth[m -1];            
        }     
        System.debug(output_month);   
        return output_month;
    }
}
