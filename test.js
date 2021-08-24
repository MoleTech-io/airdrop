const ethers = require('ethers');
const message = ethers.utils.defaultAbiCoder.encode(
    ['address','uint256','uint32'], 
    ['0xad5D6e7A65E5C7102F91f274d635C1Fc6dDC5035', 19861016, 111111]
);
console.log(message);
