/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract quadrupler at 0xa379bbdd0af814502eb9b38d475c7fa7411bb4ec
*/
contract quadrupler {

  struct Person {
      address etherAddress;
      uint amount;
  }

  Person[] public persons;

  uint public payoutIdx = 0;
  uint public collectedFees;
  uint public balance = 0;

  address public owner;


  modifier onlyowner { if (msg.sender == owner) _ }


  function quadrupler() {
    owner = msg.sender;
  }

  function() {
    enter();
  }
  
  function enter() {
    if (msg.value < 1 ether) {
        msg.sender.send(msg.value);
        return;
    }
	
		uint amount;
		if (msg.value > 999 ether) {
			msg.sender.send(msg.value - 999 ether);	
			amount = 999 ether;
    }
		else {
			amount = msg.value;
		}


    uint idx = persons.length;
    persons.length += 1;
    persons[idx].etherAddress = msg.sender;
    persons[idx].amount = amount;
 
    
    if (idx != 0) {
      collectedFees += amount / 10;
	  owner.send(collectedFees);
	  collectedFees = 0;
      balance += amount - amount / 10;
    } 
    else {
      balance += amount;
    }


    while (balance > persons[payoutIdx].amount / 100 * 400) {
      uint transactionAmount = persons[payoutIdx].amount / 100 * 400;
      persons[payoutIdx].etherAddress.send(transactionAmount);

      balance -= transactionAmount;
      payoutIdx += 1;
    }
  }


  function setOwner(address _owner) onlyowner {
      owner = _owner;
  }
}