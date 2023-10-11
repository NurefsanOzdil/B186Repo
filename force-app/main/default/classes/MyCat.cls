public class MyCat extends MyAnimal{

    
    public void meow(){
        System.debug('Cats meow...');
    }
    
    public override void eat(){ //use override keyword to update implementation
        System.debug('Cats eat by overriding!');
    }
}