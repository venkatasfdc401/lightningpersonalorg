({
	 initHelper : function(component, event, helper) {
          helper.utilSetMarkers(component, event, helper);
     },
     utilSetMarkers : function(component, event) {
          var action = component.get("c.getAllTowers");
          action.setCallback(this, function(response) {
              var state = response.getState();
               console.log(state);
              
              /*let errors = response.getError();
let message = 'Unknown error'; // Default error message
// Retrieve the error message sent by the server
if (errors && Array.isArray(errors) && errors.length > 0) {
    message = errors[0].message;
}
// Display the message
console.error(message);*/
              
              
               var data = response.getReturnValue();
               var myJSON = JSON.stringify(response.getReturnValue());
               console.log('data '+data);
              
               const dataSize = data.length;
               var markers = [];
               for(var i=0; i < dataSize; i += 1) {
                    const Tower = data[i];
                    markers.push({
                        'location': {
                             'Latitude' : Tower.Tower_Location__latitude__s,
                             'Longitude' : Tower.Tower_Location__longitude__s
                        },
                        'icon': 'utility:Tower',
                        'title' : Tower.Name,
                        'description' : Tower.Name + ' Tower Location at ' + Tower.State__r.Name
                   });
               }
               component.set('v.markersTitle', 'Out and About Communications Tower Locations');
               component.set('v.mapMarkers', markers);
              
          });
          $A.enqueueAction(action);
     }
})