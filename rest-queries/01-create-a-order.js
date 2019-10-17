// Note: Using should test syntax
module.exports = ({ response, store, repeat, }) => ({
  path: 'order.rows',
  method: 'post',
  body: response.mockUsers,
  test() {
    // store the inserted id in mockUsers
    store.mockUsers.id = store.insertId;
    // repeat this step/query as long as
    // there a more mockUsers to insert
    if(store.mockUsers){
      repeat();
    }
  }
});