using CatelogService as service from '../../srv/cat-service';
annotate service.Authors with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'dateOfBirth',
                Value : dateOfBirth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'dateOfDeath',
                Value : dateOfDeath,
            },
            {
                $Type : 'UI.DataField',
                Label : 'epoch_ID',
                Value : epoch_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'bookPrice_amount',
                Value : bookPrice_amount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'bookPrice_currency_code',
                Value : bookPrice_currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'progressChart',
                Value : progressChart,
            },
            {
                $Type : 'UI.DataField',
                Value : period,
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
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'dateOfBirth',
            Value : dateOfBirth,
        },
        {
            $Type : 'UI.DataField',
            Label : 'dateOfDeath',
            Value : dateOfDeath,
        },
        {
            $Type : 'UI.DataField',
            Label : 'epoch_ID',
            Value : epoch_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'bookPrice_amount',
            Value : bookPrice_amount,
        },
    ],
);

