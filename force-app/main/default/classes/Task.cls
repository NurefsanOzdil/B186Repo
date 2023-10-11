public class Task {

    public static String getTaskPriority(String state){
        
        //validate input first
       
        if(String.isBlank(state) || state.length() != 2){ // NY, TX, DC, CA : Virgina, Georgia
            
            return 'Wrong Abbreviation';
            
        }
        
        
        String taskPriority;
        if(State == 'CA' || State == 'NY'){
            
            taskPriority = 'High';
            
            
        }else{
            
            taskPriority = 'Normal';
        }
        
        return taskPriority;
    		
    	}
    
    
}

 //EXAMPLE 3: Based upon given State abbreviation, determine each state's Task Priority status (return priority)
// method will get abbreviation as an argument in parameter