/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract QuarterMachine at 0xe32f0a9e5a391add501c37d4672dc8b30b991a54
*/
pragma solidity ^0.4.18;

contract QuarterMachine {

  // Address of the contract creator
  address public contractOwner;

  // FIFO queue
  BuyIn[] public buyIns;

  // The current BuyIn queue index
  uint256 public index;

  // Total invested for entire contract
  uint256 public contractTotalInvested;

  // Total invested for a given address
  mapping (address => uint256) public totalInvested;

  // Total value for a given address
  mapping (address => uint256) public totalValue;

  // Total paid out for a given address
  mapping (address => uint256) public totalPaidOut;

  struct BuyIn {
    uint256 value;
    address owner;
  }

  modifier onlyContractOwner() {
    require(msg.sender == contractOwner);
    _;
  }

  function QuarterMachine() public {
    contractOwner = msg.sender;
  }

  function purchase() public payable {
    // I don't want no scrub
    require(msg.value >= 0.01 ether);

    // Take a 5% fee
    uint256 value = SafeMath.div(SafeMath.mul(msg.value, 95), 100);

    // 1.25x multiplier
    uint256 valueMultiplied = SafeMath.div(SafeMath.mul(msg.value, 125), 100);

    contractTotalInvested += msg.value;
    totalInvested[msg.sender] += msg.value;

    while (index < buyIns.length && value > 0) {
      BuyIn storage buyIn = buyIns[index];

      if (value < buyIn.value) {
        buyIn.owner.transfer(value);
        totalPaidOut[buyIn.owner] += value;
        totalValue[buyIn.owner] -= value;
        buyIn.value -= value;
        value = 0;
      } else {
        buyIn.owner.transfer(buyIn.value);
        totalPaidOut[buyIn.owner] += buyIn.value;
        totalValue[buyIn.owner] -= buyIn.value;
        value -= buyIn.value;
        buyIn.value = 0;
        index++;
      }
    }

    // if buyins have been exhausted, return the remaining
    // funds back to the investor
    if (value > 0) {
      msg.sender.transfer(value);
      valueMultiplied -= value;
      totalPaidOut[msg.sender] += value;
    }

    totalValue[msg.sender] += valueMultiplied;

    buyIns.push(BuyIn({
      value: valueMultiplied,
      owner: msg.sender
    }));
  }

  function payout() public onlyContractOwner {
    contractOwner.transfer(this.balance);
  }
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}