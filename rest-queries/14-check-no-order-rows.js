module.exports = ({ assert, response, store }) => ({
    path: 'order_rows',
    method: 'get',
    test() {
     // Check that there are no orders in DB
     assert.deepEqual(response, []);
    },
    setup() {
      // Store the mockorders in the db (setup for next step/query)
      store.mockOrdersRows = require('./mock-order-rows.json');
      for(let i=0; i<store.mockOrder-rows.length; i++){
          store.mockOrderRows[i].productid=store.mockProducts[i].produtid;
      }
      console.log("mockOrder-rows", store.mockOrderRows)
    }
  });