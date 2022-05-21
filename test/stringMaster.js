const StringMaster = artifacts.require('StringMaster');

contract('StringMaster', () => {
  let stringMaster = null;
  before(async () => {
    stringMaster = await StringMaster.deployed();
  });

  it('should return length', async () => {
    const length = await stringMaster.length('xxxyyy');
    assert(length.toNumber() === 6);
  });

  it('should concatenate', async () => {
    const concatenatedString = await stringMaster.concatenate('yyy', 'xxxx');
    assert(concatenatedString === 'yyyxxxx');
  });
});