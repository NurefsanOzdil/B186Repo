public abstract class AnimalParent {
    
      public abstract void eat();//removed unsued implementation and make it abstract with "abstract" keyword
    
    public virtual void drink(){
        System.debug('Animals drink!');
    }

    public void sleep(){
        System.debug('Animals sleep!');
    }//basic inheritance 

}