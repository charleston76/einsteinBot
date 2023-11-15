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
Params.put('externalTicketId', '55778899');
Params.put('recordId', '0Mw04000000ChMSCA0');
Params.put('isExternalInteraction', true);

//create instance of Interview
Flow.Interview.General_MIAW_Routing objFlow = new Flow.Interview.General_MIAW_Routing (Params);
