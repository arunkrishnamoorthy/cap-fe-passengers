using TravelService as service from '../../srv/travel-service';
using from '../../db/master-data';

annotate service.Passenger with @odata.draft.enabled;
annotate service.Passenger with @Capabilities : { Deletable: false };
annotate service.Passenger with @Common.SemanticKey: ['CustomerID'];

annotate service.Passenger with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'CustomerID',
            Value : CustomerID,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : LastChangedAt,
        },
        {
            $Type : 'UI.DataField',
            Value : LastChangedBy,
        },
    ]
);
annotate service.Passenger with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'CustomerID',
                Value : CustomerID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'FirstName',
                Value : FirstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LastName',
                Value : LastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : Title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Street',
                Value : Street,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PostalCode',
                Value : PostalCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'City',
                Value : City,
            },
            {
                $Type : 'UI.DataField',
                Value : CountryCode_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PhoneNumber',
                Value : PhoneNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'EMailAddress',
                Value : EMailAddress,
            },
        ],
    },
    UI.FieldGroup #WizardGeneral : {
        Label: 'Administration',
        Data: [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            }
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
         {
            $Type : 'UI.ReferenceFacet',
            ID : 'WizardGeneral',
            Label : 'Adminstration',
            Target : '@UI.FieldGroup#WizardGeneral',
        },
    ]
);


annotate service.Passenger with @(UI.SelectionFields: [
    CustomerID,City
]);
