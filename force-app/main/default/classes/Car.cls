public class Car {
    
    public string carColor = '';
    public string carName = '';
    
    private integer maxSpeed = 150;

    public void SwitchOn() {
        system.debug('starting the car');

    }
    public void drive(){
        system.debug('Driving '+ carName + ', color is'+ carColor);
    }

    public void driveAtMaxSpeed(){
        string drivingDescription = 'Driving '+ carName + 'at '+ maxSpeed + 'km/h';
        system.debug(drivingDescription);
    }
}


