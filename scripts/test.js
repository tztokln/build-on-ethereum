const keccak256 = require('keccak256')
// 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365
console.log(keccak256(170).toString('hex')) // "1c8aff950685c2ed4bc3174f3472287b56d9517b9c948127319a09a7a36deac8"

console.log(keccak256(Buffer.from('hello')).toString('hex')) // "1c8aff950685c2ed4bc3174f3472287b56d9517b9c948127319a09a7a36deac8"

console.log("TEsT")

