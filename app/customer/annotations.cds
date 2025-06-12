using AdminService as service from '../../srv/admin-service';
annotate service.Authors with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Date Of Birth',
                Value : dateOfBirth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Date Of Death',
                Value : dateOfDeath,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Epoch ID',
                Value : epoch_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : bookPrice_amount,
                Label : 'Total Book Price',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Book',
            ID : 'Book',
            Target : 'book/@UI.LineItem#Book',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'DateOfBirth',
            Value : dateOfBirth,
        },
        {
            $Type : 'UI.DataField',
            Label : 'DateOfDeath',
            Value : dateOfDeath,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Epoch ID',
            Value : epoch_ID,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#progressChart',
            Label : 'progressChart',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Combo Price',
            Value : bookPrice_amount,
        },
    ],

    UI.SelectionFields : [
        name,
        dateOfBirth,
        dateOfDeath,
    ],
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Details',
            ID : 'Details',
            Target : '@UI.FieldGroup#Details',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'epoch_ID',
            Target : '@UI.DataPoint#progress',
        },
    ],
    UI.FieldGroup #Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : '{i18n>Id}',
        TypeNamePlural : '{i18n>Id}',
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
    },
    UI.FieldGroup #new : {
        $Type : 'UI.FieldGroupType',
        Data : [
            
        ],
    },
    UI.DataPoint #progress : {
        $Type : 'UI.DataPointType',
        Value : progressChart,
        Title : 'Progress Chart',
        TargetValue : 100,
        Visualization : #Progress,
    },
    UI.DataPoint #progressChart : {
        Value : progressChart,
        Visualization : #Progress,
        TargetValue : 100,
    },
);

// annotate service.Authors with {
//     name @(
//         Common.Label : 'name',
//         Common.ValueList : {
//             $Type : 'Common.ValueListType',
//             CollectionPath : 'Authors',
//             Parameters : [
//                 {
//                     $Type : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : name,
//                     ValueListProperty : 'name',
//                 },
//             ],
//             Label : 'Author',
//         },
//         Common.ValueListWithFixedValues : true,
//     )
// };

annotate service.Authors with {
    dateOfBirth @Common.Label : 'dateOfBirth'
};

annotate service.Authors with {
    dateOfDeath @Common.Label : 'dateOfDeath'
};

annotate service.Books with @(
    UI.LineItem #Books : [
    ],
    UI.LineItem #Book : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'title',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'stock',
        },
        {
            $Type : 'UI.DataField',
            Value : price_amount,
            Label : 'price_amount',
        },
        {
            $Type : 'UI.DataField',
            Value : author_ID,
            Label : 'author_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : parent_ID_ID,
            Label : 'parent_ID_ID',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Book',
            ID : 'Book',
            Target : '@UI.FieldGroup#Book',
        },
    ],
    UI.FieldGroup #Book : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'title'
                
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'stock',
            },
            {
                $Type : 'UI.DataField',
                Value : publcountry_code,
            },
            {
                $Type : 'UI.DataField',
                Value : price_amount,
                Label : 'price_amount',
            },
        ],
    },
);

