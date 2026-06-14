@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Join Explícito'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_EXPLICIT_JOIN_53 
    as select from /dmo/customer as Customer
    association[1..*] to /dmo/booking as _booking
                        on Customer.customer_id = _booking.customer_id
    
{
    key customer_id as CustomerId,
    first_name as FirstName,
    last_name as LastName,
    _booking[inner].booking_date as BookingDate
}
