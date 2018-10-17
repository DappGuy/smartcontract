/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Token at 0xf6c5e68c02aa801a2713a3ac4ce3e668b95be534
*/
contract Token {
    
	/* Public variables of the token */
	string public name;
	string public symbol;
	uint8 public decimals;
	uint256 public totalSupply;
    
	/* This creates an array with all balances */
	mapping (address => uint256) public balanceOf;

	/* This generates a public event on the blockchain that will notify clients */
	event Transfer(address indexed from, address indexed to, uint256 value);

	function Token() {
	    totalSupply = 10*(10**8)*(10**18);
		balanceOf[msg.sender] = 10*(10**8)*(10**18);              // Give the creator all initial tokens
		name = "MoDou";                                   // Set the name for display purposes
		symbol = "M";                               // Set the symbol for display purposes
		decimals = 18;                            // Amount of decimals for display purposes
	}

	function transfer(address _to, uint256 _value) {
	/* Check if sender has balance and for overflows */
	if (balanceOf[msg.sender] < _value || balanceOf[_to] + _value < balanceOf[_to])
		revert();
	/* Add and subtract new balances */
	balanceOf[msg.sender] -= _value;
	balanceOf[_to] += _value;
	/* Notifiy anyone listening that this transfer took place */
	Transfer(msg.sender, _to, _value);
	}

	/* This unnamed function is called whenever someone tries to send ether to it */
	function () {
	revert();     // Prevents accidental sending of ether
	}
}