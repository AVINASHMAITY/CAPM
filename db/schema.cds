namespace com.sap.learning;

using { cuid, managed , Currency, Country, sap.common.CodeList } from '@sap/cds/common';
using { Attachments } from '@cap-js/attachments';


entity Books : cuid,managed {
        title       : localized String(255);
        author      : Association to Author @mandatory;
        genre       : Genre @assert.range:true;
        publcountry : Country;
        parent_ID   : Association to Author;
        stock       : NoOfBooks default 0;
        price       : Price;
        isHardCover : Boolean;
};

type Genre : Integer enum{
    fiction = 1;
    non_fiction = 2;
};

type NoOfBooks : Integer;

type Price {
    amount : Decimal;
    currency : Currency;
}



@odata.draft.enabled
entity Author: cuid, managed {
        name        : String(100) @mandatory;
        dateOfBirth : Date;
        dateOfDeath : Date;
        epoch       : Association to Epochs @assert.target;
        book        : Composition of Many Books On book.author = $self;
        bookPrice   : Price;
        progressChart : Integer;
        attachments: Composition of many Attachments;
}

entity Epochs : CodeList {
    key ID : Integer;
}

annotate Author with {
    modifiedAt @odata.etag;
};


annotate Books with {
    modifiedAt @odata.etag;
};
