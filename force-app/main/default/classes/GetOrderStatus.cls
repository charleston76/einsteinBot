public class GetOrderStatus {
    public class OrderOutput{ 
        @InvocableVariable(required=false) 
        public String sOrderStatus; 
    }

    public class OrderInput{ 
        @InvocableVariable(required=false) 
        public String sOrderNumber; 
    }

    @InvocableMethod(label='Get Order Status')
    public static List<OrderOutput> getUserName(List<OrderInput> orderInputs){

        Set<String> orderNumbers = new Set<String>();
        List<OrderOutput> outputs = new List<OrderOutput>();

        //Get the order numbers from the input 
        for(OrderInput orderInput: orderInputs){ 
            orderNumbers.add(orderInput.sOrderNumber); 
        }

        //Get the order objects from the set of order numbers 
        List<BotOrder__c> orders= [SELECT Name, Status__c FROM BotOrder__c WHERE Name in: orderNumbers];

       // Create a mapo for der numbers and order status values
        Map<String,String> mapNameStatus = new Map<String,String>();

        for(BotOrder__c order: orders){ 
            mapNameStatus.put(order.Name , order.Status__c); 
        }

        // Build a list of order status values for the output
        List<OrderOutput> orderOutputs = new List<OrderOutput>();

        for(OrderInput orderInput : orderInputs){
            OrderOutput orderOutput = new OrderOutput();
            //Do we have a status for this order number?
            if(mapNameStatus.containsKey(orderInput.sOrderNumber)){
                //If so, then add the status
                orderOutput.sOrderStatus = mapNameStatus.get(orderInput.sOrderNumber);
            } else{
                //If not, then add an unknow nstatus value
                orderOutput.sOrderStatus = 'Order not found';
            }
            orderOutputs.add(orderOutput);
        }

        return orderOutputs;
    }
}