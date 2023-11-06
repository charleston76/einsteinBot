public class MessagingContactData {
    public class MessagingInput{ 
        @InvocableVariable(required=false) 
        public ID endUserID; 
    }

    public class MessagingOutput{ 
        @InvocableVariable(required=false) 
        public String sContactName; 
    }

    private static String scrubPhoneNumber(String rawNumber){ 
        if(rawNumber==null){ return null; } 
        //Removeallnon-digitvalues 
        String scrubbedNumber=rawNumber.replaceAll('[^0-9]',''); 
        //NOTE:You can add some additional logic here to handle 
        // international numbers and various edge cases. 
        return scrubbedNumber; 
    }

    @InvocableMethod(label='Find Contact for Messaging User')
    public static List<MessagingOutput> getUserName(List<MessagingInput> inputs){

        List<MessagingOutput> outputs = new List<MessagingOutput>();

        for(MessagingInput input:inputs){
            //Create a variable to storethe username 
            String name='messaging user';

            //Get the messaging end user record from the ID 
            List<MessagingEndUser> messagingUsers=[SELECT Id,Name FROM MessagingEndUser WHERE Id=: input.endUserID LIMIT 1];
            //Did we find the messaging user?
            if(!messagingUsers.isEmpty()){
                //Strip out any invalid values from the phone number
                String phoneNumber=scrubPhoneNumber(messagingUsers[0].Name);
                //Get the contact based on the phone number 
                //(NOTE:This is just a simple example query. 
                // Adjust this query as needed...)
                List<Contact> contacts= [SELECT Name FROM Contact WHERE Phone=:phoneNumber LIMIT 1];

                //Did wef ind the contact?
                if(!contacts.isEmpty()){
                    //Grab the name of the contact
                    name=contacts[0].Name;
                }
            }
            //Store the name in an output variable
            MessagingOutput output=new MessagingOutput();
            output.sContactName=name;
            //Add the name to the list of outputs
            outputs.add(output);
        }
        return outputs;
    }
}