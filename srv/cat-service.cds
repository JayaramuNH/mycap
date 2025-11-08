using my.bookshop as my from '../db/schema';
using anubhav.db as db from '../db/datamodel';


service CatalogService @(path:'/CatalogService'){
    @readonly 
    entity Books as projection on my.Books;
    function hello(to:String) returns String; 

    entity EmployeeSet as projection on db.master.employees;

    entity AddressSet as projection on db.master.address;

    entity ProductSet as projection on db.master.product;

    entity BPSet as projection on db.master.businesspartner;

    entity POs @(
        title: '{i18n>poHeader}'
    ) as projection on db.transaction.purchaseorder{
        *,
        Items: redirected to POItems
    }

    entity POItems @( title : '{i18n>poItems}' )
    as projection on db.transaction.poitems{
        *,
        PARENT_KEY: redirected to POs,
        PRODUCT_GUID: redirected to ProductSet
    }

    entity POWorklist as projection on db.cdsview.POWorklist;
    entity ProductOrders as projection on db.cdsview.ProductViewSub;
    // entity ProductAggregation as projection on db.cdsview.CProductValuesView excluding{
    //     ProductId
    // };
}
