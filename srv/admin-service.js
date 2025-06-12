const { event } = require('@sap/cds');
const cds = require('@sap/cds');
const e = require('express');
// const { data } = require('@sap/cds/lib/dbs/cds-deploy');


class AdminService extends cds.ApplicationService {
  
   init(){
    const { Authors, Books } = this.entities;
    this.before(['CREATE','UPDATE'],Authors,this.validationLife);
    

    this.before("SAVE","Authors",async req=>{
        if(!req.event === 'CREATE' && !req.event ===  'UPDATE'){
            return;
        };

        console.log("events", req);

        const { ID } = req.data
        console.log('ID',ID);

        const  data = await SELECT.from(Books.drafts).where `author_ID = ${ID}`;
        const  value = await SELECT.from(Books.drafts).columns('price_amount');
        let    quantity = await SELECT.from(Books.drafts).columns('stock');
        
        let sum = 0;
        
        for(let d of value){
            sum +=d.price_amount;
            console.log("d value", d.price_amount);
        };
       
        let stk = 0;
        for(let s of quantity){
          stk = s.stock;   
        };

        let text = 'Flat 20% Off Crazy Deal'

        if(stk > 200 && sum > 500 && !req.data.name || !req.data.name.includes(text)) {
            req.data.name = (req.data.name + '' ) + ' ' + text;
        }           
        
        req.data.bookPrice_amount = sum;       

        console.log("Value of price",value);
        console.log("stocks",quantity);

        let num = 10;

        if(data.length >= 1){
            num += 20;           
        }
        if(data.length >= 2){
            num += 20;
        }
        if(data.length >= 3){
            num +=30;
        } 
        if(data.length >= 4){
            num += 20;
        };
        
        req.data.progressChart = num;   
        
        console.log('data',data);
        
        
    });
    

    return super.init();

   };

   validationLife(req) {
    const { dateOfBirth, dateOfDeath } = req.data;

    if(!dateOfBirth || !dateOfDeath){
        return req.error('something went wrong');
    };

    const birth = new Date(dateOfBirth);
    const death = new Date(dateOfDeath);

    if(death<birth){
        req.error('DEATH_BEFORE_BIRTH',[dateOfBirth,dateOfDeath]);
        
    }
    console.log('print date:',dateOfBirth);

   };

}

module.exports = AdminService;