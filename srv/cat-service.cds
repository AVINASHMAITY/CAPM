using com.sap.learning as db from '../db/schema';

service CatelogService @(path : '/cat') {

    entity Authors as projection on db.Author {
       *,
      epoch.name as period
    } excluding{
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity Books as projection on db.Books {
        ID,
        title,
        author.name as writer,
        publcountry.name as publcountry,
        isHardCover,
        price.amount,
        price.currency,
        stock,
        author
    };

    action submitOrder(book : db.Books:ID,quantity:Integer ) returns {
        stock : db.Books:stock;
    };

    action changeRadio(book : db.Books:ID ) returns Integer;

}