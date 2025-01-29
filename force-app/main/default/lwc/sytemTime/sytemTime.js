import { LightningElement,api,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import {closeActionScreenEvent} from 'lightning/actions';


export default class sytemTime extends LightningElement {
    @api recordId;
    renderFlow=false;
    flowApiName = "Update_Current_System_Time_Field";
    
    get flowtusChangeInputVariables(){
        return[
            {
                name: 'IdVariable',
                type: 'String',
                value: this.recordId    
            },]
            
           }
          handleClick(event){
            console.log('rec id///'+this.recordId);
            this.renderFlow=true;
            window.location.reload()
            
           }
    }