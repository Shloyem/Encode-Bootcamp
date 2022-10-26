Background:
1. Our team was operating from wallet
https://goerli.etherscan.io/address/0xfa251b9db8d1918ea3747a98602ebae6ff068d55

Steps:
1. Fulfill the Homework pdf requirements parts 1,2:
- Take the contract and interface from [this](https://gist.github.com/letsgitcracking/239306ea9f08d7e270f9d7e5245bdd2b) gist
- Deploy the contract to Goelri test net and note the address it was deployed to.
- Register your team name, team number with your team wallet [here](http://team-registration.javascrypt-.repl.co/)
it sent a transaction to
https://goerli.etherscan.io/address/0x2410637d1302a87fca0ca71f6aeea3627a50071b
2. The contract from #1 has functions to read:
https://goerli.etherscan.io/address/0x2410637d1302a87fca0ca71f6aeea3627a50071b#readContract
Selecting info() returns:
"68747470733a2f2f6269742e6c792f33655a396f566d"
3. Using [Hex to String converter](https://www.rapidtables.com/convert/number/hex-to-ascii.html):
The output of Hex from #2 is: https://bit.ly/3eZ9oVm
4. Entering URL from #3, there is another value: "68747470733A2F2F6269742E6C792F334E3674377953"
5. Using [Hex to String converter](https://www.rapidtables.com/convert/number/hex-to-ascii.html) returns: https://bit.ly/3N6t7yS
6. The URL directs to a [tweet](https://twitter.com/Janedoe42489302/status/1584951602749722625) with a binary value:
"1110011101010000000100111000101001011101011011010010110000110111100000101111110101010010000101100001101111101100101111110001110111000100011110101111101111110000100110100011100110001010000001100001111111010010010000100100001100110000101010101010110101011001"
7. Using [binary-to-hex converter](https://www.rapidtables.com/convert/number/binary-to-hex.html) returns:
"E750138A5D6D2C3782FD52161BECBF1DC47AFBF09A398A061FD2424330AAAD59"
8. Searching it in Etherscan find a transaction:
https://goerli.etherscan.io/tx/0xE750138A5D6D2C3782FD52161BECBF1DC47AFBF09A398A061FD2424330AAAD59
That has input data of:
"0x68747470733a2f2f6269742e6c792f33573333624969"
9. Using [Hex to String converter](https://www.rapidtables.com/convert/number/hex-to-ascii.html) returns: https://bit.ly/3W33bIi
10. This bitly that translates into: https://letsgitcracking.github.io/team-game/ hints to inspect the page.
Inspecting shows a commented URL address: https://bit.ly/3ze0V7s that leads to [this tweet](https://twitter.com/operationcodes/status/1584938372078137344)
11. The tweet has the final address: 0x18acF9DEB7F9535F4848a286b68C729AAc55697a
A contract [containing GetTreasure() function](https://goerli.etherscan.io/address/0x18acF9DEB7F9535F4848a286b68C729AAc55697a#writeContract) like we were searching according to the interface provided.
12. Continue Homework pdf requirements part 3:
After contract is found on the test net, you need to
- Call it from your interface contract with your team wallet.
Ours was https://goerli.etherscan.io/address/0xda6bef8b46a4683dc84770f37465ccc5c8fcb042
- If successful - you should see the event in TreasureChest.sol
https://goerli.etherscan.io/tx/0xe1422e14c3bd0ae7ae3526cd51b991914b8f96312477b12bfaaf216d1089e047#eventlog

