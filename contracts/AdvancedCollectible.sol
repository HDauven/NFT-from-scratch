pragma solidity 0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract AdvancedCollecible is ERC721, VRFConsumerBase {

    bytes32 internal keyHash;
    uint public fee;

    constructor(address _VRFCoordinator, address _LinkToken, bytes32 _keyhash) public
        VRfConsumer(_VRFCoordinator, _LinkToken)
        ERC721("Doggies", "DOG") {
            keyHash = _keyhash;
            fee = 0.1 * 10 ** 18;
    }

    function createCollectible(uint userProvidedSeed, string memory tokenURI) public returns (bytes32) {
        bytes32 requestId = requestRandomness(keyHash, fee, userProvidedSeed);
    }
}