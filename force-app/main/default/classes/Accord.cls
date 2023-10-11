public class Accord implements Engine, Brake, AirCond{ //this is not interface, this is a child class
    
    public void abs(){
        System.debug('Accord uses the best brake in Japan!');
    }
    
    public void hybrid(){
        System.debug('Accord is using a good engine!');
    }

    public void aircond(){
        System.debug('inside of Accord is so cool!');
    }
    
    //do not type "override" in methods: bcs Apex already knows you overriding in from Interface
}