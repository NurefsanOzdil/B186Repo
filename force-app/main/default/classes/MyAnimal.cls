public virtual class MyAnimal {
    
    public virtual void eat(){ //use "virtual" keyword to allow overriding by child class
        System.debug('Animals eat...');
    } 

    public virtual void drink(){
        
        System.debug('Animals drink...');
    }
}