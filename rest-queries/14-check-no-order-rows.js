// Note: Using assert test syntax
module.exports = ({ assert, response, store }) => ({
  path: 'orderrows',
  method: 'get',
  test() {
   // Check that there are no orders in DB
   assert.deepEqual(response, []);
  },
  setup() {
    // Store the mockorders in the db (setup for next step/query)
    store.mockOrderRows = require('./mock-orderrow.json');
    for(let i=0; i<store.mockOrderRows.length; i++){
      store.mockOrderRows[i].productid=store.mockProducts[i].productid;
      store.mockOrderRows[i].orderid=store.mockOrders[i].orderid;
    
  }
    console.log("mockOrderRows", store.mockOrderRows)
  }
});