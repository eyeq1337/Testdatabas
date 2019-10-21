// Note: Using assert test syntax
module.exports = ({ expect, response }) => ({
    path: 'allProData',
    method: 'get',
    test() {
     expect(response.length).to.equal(5)
  }
});