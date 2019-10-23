import { LightningElement ,track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import runcustjb from '@salesforce/apex/RunAPEXJob.runcustomjob';
import runregjb from '@salesforce/apex/RunAPEXJob.runregularjob';
export default class ShowToastMessage extends LightningElement {
    
    @track success;
    @track error;

    msg = '';
    msgchange(event){
        this.msg = event.target.value;
    }

    /*ShowToastMessage() {
        const toastEvnt = new  ShowToastEvent( {
              title: 'Welcome in Apex Hours' ,
              message: this.msg ,
              variant: 'success' ,
        });
        this.dispatchEvent (toastEvnt);
   }*/
   
   runCustom(){
        runcustjb()
        .then(result => {
            this.success = result;

            const toastEvnt = new  ShowToastEvent( {
                title: 'Custom Job Scheduled' ,
                message: this.msg ,
                variant: 'success' ,
          });
          this.dispatchEvent (toastEvnt);
        })
        .catch(error => {
            this.error = error;
            const toastEvnt = new  ShowToastEvent( {
                title: 'Regular Job not Scheduled' ,
                message: this.error ,
                variant: 'error' ,
            });
            this.dispatchEvent (toastEvnt);
        });
    }
    runRegular(){
        runregjb()
        .then(result => {
            this.success = result;

            const toastEvnt = new  ShowToastEvent( {
                title: 'Regular Job Scheduled' ,
                message: this.msg ,
                variant: 'success' ,
          });
          this.dispatchEvent (toastEvnt);
        })
        .catch(error => {
            this.error = error;
            const toastEvnt = new  ShowToastEvent( {
                title: 'Regular Job not Scheduled' ,
                message: this.error ,
                variant: 'error' ,
            });
            this.dispatchEvent (toastEvnt);
        });
    }
}