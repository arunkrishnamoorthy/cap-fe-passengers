using {
    Currency,
    Country,
    custom.managed,
    sap
} from './common';

namespace sap.fe.cap.travel;

@cds.autoexpose @readonly
aspect MasterData {}

entity Airline: MasterData {
    key AirlineID: String(3);
        Name: String(40);
        CurrencyCode: Currency;
        AirlinePicUrl: String @UI: { IsImageURL: true }
}

entity Airport: MasterData {
    key AirportID: String(3);
        Name: String(40);
        City: String(40);
        CountryCode: Country;
}

entity Supplement: managed, MasterData {
    key SupplementID: String(10);
        Price: Decimal(16,3);
        Type: Association to SupplementType;
        Description: localized String(1024);
        CurrencyCode: Currency;
}

entity SupplementType:  sap.common.CodeList {
    key code: String enum {
        Beverage = 'BV';
        Meal = 'ML';
        Luggage = 'LU';
        Extra = 'EX'
    }
}

entity Flight: MasterData {
    key AirlineID: String(3);
    key FlightDate: Date;
    key ConnectionID: String(4);
        Price: Decimal(16,3);
        CurrencyCode: Currency;
        PlaneType: String(10);
        MaximumSeats: Integer;
        OccupiedSeats: Integer;
        to_Airline: Association to Airline 
                    on to_Airline.AirlineID = AirlineID;
        to_Connection: Association to FlightConnection
                    on to_Connection.ConnectionID = ConnectionID 
                    and to_Connection.AirlineID = AirlineID;
}

entity FlightConnection: MasterData {
    key ConnectionID: String(4);
    key AirlineID: String(3);
        DepatureAirport: Association to Airport;
        DestinationAirport: Association to Airport;
        DepatureTime: Time;
        ArrivalTime: Time;
        Distance: Integer;
        DistanceUnit: String(3);
        to_Airline: Association to Airline 
                    on to_Airline.AirlineID = AirlineID;
}

entity Passenger: managed {
    key CustomerID: String(6) @Core.Computed;
        FirstName: String(40);
        LastName: String(40);
        Title: String(10);
        Street: String(60);
        PostalCode: String(10);
        City: String(40);
        CountryCode: Country;
        PhoneNumber: String(30);
        EMailAddress: String(256);
        to_Address: Association to PassengerAddress 
                    on to_Address.Parent = $self;
}

entity PassengerAddress: managed {
    key AddressId: String(6) @Core.Computed;
        Street: String(40);
        City: String(40);
        Country: String(40);
        PostalCode: String(10);
        Parent: Association to Passenger;
}

entity TravelAgency: MasterData {
    key AgencyID: String(6);
        Name: String(80);
        Street: String(60);
        PostalCode: String(10);
        City: String(40);
        CountryCode: Country;
        PhoneNumber: String(30);
        EMailAddress: String(256);
        WebAddress: String(256);
}