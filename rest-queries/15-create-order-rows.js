// Note: Using should test syntax
module.exports = ({ response, store, repeat, i }) => ({
  path: 'orderrows',
  method: 'post',
  body: store.mockOrderRows[i],
  test() {
    // check that a row was inserted in the db
    response.affectedRows.should.equal(1);
    // store the inserted id in mockUsers
    // store.mock[i].productid = response.insertId;
    // repeat this step/query as long as
    // there a more mockUsers to insert
    if(store.mockOrderRows[i + 1]){
      repeat();
    }
  }
});