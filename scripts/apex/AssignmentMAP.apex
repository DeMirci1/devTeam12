map<string, integer> marksObtainInMaths = new map<string, integer>();
marksObtainInMaths.put('0111CE112', 40);
marksObtainInMaths.put('0111CE102', 19);
marksObtainInMaths.put('0111CE100', 33);
marksObtainInMaths.put('0111CE098', 40);
marksObtainInMaths.put('0111CE096', 15);
marksObtainInMaths.put('0111CE094', 35);
integer rollNumber = 
system.debug('Map of the student Roll number and Marks' + marksObtainInMaths);

List<integer> marks = marksObtainInMaths.values();
system.debug('Marks list is... ' + marks);

set<string> rollNumber = marksObtainInMaths.keySet();
system.debug('Roll list is... ' + rollNumber);

for (string eachRollNumber : rollNumber){
    integer eachMark = marksObtainInMaths.get(eachRollNumber);
    
    if(eachMark<20){
    system.debug( rollNumber + ' is not qualified for next class');
    } else {
        system.debug( rollNumber + ' is qualified for next class');
    }
}


