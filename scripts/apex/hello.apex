        // Create the members
        for (Integer intCapacity : mapUserCapacity.keySet()){
          Map<String, Object> Params = new Map<String, Object>();
          for (String userId : mapUserCapacity.get(intCapacity)){
            String capacityNameParam = String.valueOf(intCapacity).leftPad(2, '0');
            Params.put('capacityParam', intCapacity);
            Params.put('capacityNameParam', capacityNameParam);
            Params.put('userIdParam', userId);
            System.debug(CLASS_NAME + ' ' + METHOD_NAME + ' ' + 'capacityParam ' + intCapacity );
            System.debug(CLASS_NAME + ' ' + METHOD_NAME + ' ' + 'capacityNameParam ' + capacityNameParam );
            System.debug(CLASS_NAME + ' ' + METHOD_NAME + ' ' + 'userIdParam ' + userId );
            //create instance of Interview
            Flow.Interview.CustomGroupMemberCapacityFlow objFlow = new Flow.Interview.CustomGroupMemberCapacityFlow (Params);
            //Invoke start method
            objFlow.start();
            // //get value from Flow
            string createdUserId =(string)objFlow.getvariableValue('createdUserId');
            System.debug(CLASS_NAME + ' ' + METHOD_NAME + ' ' + 'createdUserId ' + createdUserId );

            string presenceConfigurationId =(string)objFlow.getvariableValue('PresenceConfigurationToAssign');
            System.debug(CLASS_NAME + ' ' + METHOD_NAME + ' ' + 'presenceConfigurationId ' + presenceConfigurationId );
          // }  
          }



Map<String, Object> Params = new Map<String, Object>();
Params.put('endUserId', '0038D00000JB3qwQAD');
Params.put('externalTicketId', '1234567890');
Params.put('messagingChannelId', '0Mj8D0000008Oa5SAE');
Params.put('queueId', '00G8D0000034LtsUAE');
Params.put('recordId', '0Mw8D0000007HpRSAU');

//create instance of Interview
Flow.Interview.MIAWToQueue objFlow = new Flow.Interview.MIAWToQueue (Params);
