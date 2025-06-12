const cds = require('@sap/cds');

class CatelogService extends cds.ApplicationService {
  
    init(){
        const { Books } = this.entities;

        this.after(['READ'], Books, this.grantDiscount);

        this.on('submitOrder',this.reduceStock);

        // this.on('changeRadio',this.radioUpdate);

        return super.init();

    };

    // async radioUpdate(req){
    //     const { Books } = this.entities;
   
    //     const { ID } = req.data;
   
    //     const count = await SELECT.from(Books).where({author_ID : ID }).columns('count');
    //     console.log('print',count);
    //     return count[0].total;
   
    //   };

      

    async reduceStock(req){
      
        const { Books } = this.entities;

        const { book,quantity } = req.data;

        if(quantity < 1){
           return req.error('INVALID_QUANTITY');
        }

        const b = await SELECT.one.from(Books).where({ ID:book }).columns(b => { b.stock } );
        console.log("B",b);

        if(!b){
            return req.error('BOOK_NOT_FOUND',[book]);
        };

        let { stock } = b;

        if(quantity > stock){
            return req.error(`ORDER_EXCEEDS_STOCK`,[quantity,stock,book]);
        }

        await UPDATE(Books).where({ID:book}).with({ stock : { "-=" : "quantity" } });

        return { stock : stock - quantity };

    };

    grantDiscount(results){
        
        for(let b of results)
            if(b.stock > 200){
                 b.title += '--11% Discount';
                console.log(b);
            }
           
          }
    };


module.exports = CatelogService;

