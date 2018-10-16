/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DAOToken at 0x3f8d47619d132577260fd6db8d665d0a9d37c579
*/
pragma solidity ^0.4.21;

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
      * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
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

    contract Ownable {
      address public owner;


      event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


      /**
       * @dev The Ownable constructor sets the original `owner` of the contract to the sender
       * account.
       */
      function Ownable() public {
        owner = msg.sender;
      }

      /**
       * @dev Throws if called by any account other than the owner.
       */
      modifier onlyOwner() {
        require(msg.sender == owner);
        _;
      }

      /**
       * @dev Allows the current owner to transfer control of the contract to a newOwner.
       * @param newOwner The address to transfer ownership to.
       */
      function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
      }

    }

    contract ERC20Basic {
      function totalSupply() public view returns (uint256);
      function balanceOf(address who) public view returns (uint256);
      function transfer(address to, uint256 value) public returns (bool);
      event Transfer(address indexed from, address indexed to, uint256 value);
    }

    contract ERC20 is ERC20Basic {
      function allowance(address owner, address spender) public view returns (uint256);
      function transferFrom(address from, address to, uint256 value) public returns (bool);
      function approve(address spender, uint256 value) public returns (bool);
      event Approval(address indexed owner, address indexed spender, uint256 value);
    }

    contract BasicToken is ERC20Basic {
      using SafeMath for uint256;

      mapping(address => uint256) balances;

      uint256 totalSupply_;

      /**
      * @dev total number of tokens in existence
      */
      function totalSupply() public view returns (uint256) {
        return totalSupply_;
      }

      /**
      * @dev transfer token for a specified address
      * @param _to The address to transfer to.
      * @param _value The amount to be transferred.
      */
      function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
      }

      /**
      * @dev Gets the balance of the specified address.
      * @param _owner The address to query the the balance of.
      * @return An uint256 representing the amount owned by the passed address.
      */
      function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
      }

    }

    contract StandardToken is ERC20, BasicToken {

      mapping (address => mapping (address => uint256)) internal allowed;


      /**
       * @dev Transfer tokens from one address to another
       * @param _from address The address which you want to send tokens from
       * @param _to address The address which you want to transfer to
       * @param _value uint256 the amount of tokens to be transferred
       */
      function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        Transfer(_from, _to, _value);
        return true;
      }

      /**
       * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
       *
       * Beware that changing an allowance with this method brings the risk that someone may use both the old
       * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
       * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
       * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
       * @param _spender The address which will spend the funds.
       * @param _value The amount of tokens to be spent.
       */
      function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
      }

      /**
       * @dev Function to check the amount of tokens that an owner allowed to a spender.
       * @param _owner address The address which owns the funds.
       * @param _spender address The address which will spend the funds.
       * @return A uint256 specifying the amount of tokens still available for the spender.
       */
      function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
      }

      /**
       * @dev Increase the amount of tokens that an owner allowed to a spender.
       *
       * approve should be called when allowed[_spender] == 0. To increment
       * allowed value is better to use this function to avoid 2 calls (and wait until
       * the first transaction is mined)
       * From MonolithDAO Token.sol
       * @param _spender The address which will spend the funds.
       * @param _addedValue The amount of tokens to increase the allowance by.
       */
      function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
        Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
      }

      /**
       * @dev Decrease the amount of tokens that an owner allowed to a spender.
       *
       * approve should be called when allowed[_spender] == 0. To decrement
       * allowed value is better to use this function to avoid 2 calls (and wait until
       * the first transaction is mined)
       * From MonolithDAO Token.sol
       * @param _spender The address which will spend the funds.
       * @param _subtractedValue The amount of tokens to decrease the allowance by.
       */
      function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
          allowed[msg.sender][_spender] = 0;
        } else {
          allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
        }
        Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
      }

    }

    contract ERC827 is ERC20 {

      function approve( address _spender, uint256 _value, bytes _data ) public returns (bool);
      function transfer( address _to, uint256 _value, bytes _data ) public returns (bool);
      function transferFrom( address _from, address _to, uint256 _value, bytes _data ) public returns (bool);

    }

    contract ERC827Token is ERC827, StandardToken {

      /**
         @dev Addition to ERC20 token methods. It allows to
         approve the transfer of value and execute a call with the sent data.

         Beware that changing an allowance with this method brings the risk that
         someone may use both the old and the new allowance by unfortunate
         transaction ordering. One possible solution to mitigate this race condition
         is to first reduce the spender's allowance to 0 and set the desired value
         afterwards:
         https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729

         @param _spender The address that will spend the funds.
         @param _value The amount of tokens to be spent.
         @param _data ABI-encoded contract call to call `_to` address.

         @return true if the call function was executed successfully
       */
      function approve(address _spender, uint256 _value, bytes _data) public returns (bool) {
        require(_spender != address(this));

        super.approve(_spender, _value);

        require(_spender.call(_data));

        return true;
      }

      /**
         @dev Addition to ERC20 token methods. Transfer tokens to a specified
         address and execute a call with the sent data on the same transaction

         @param _to address The address which you want to transfer to
         @param _value uint256 the amout of tokens to be transfered
         @param _data ABI-encoded contract call to call `_to` address.

         @return true if the call function was executed successfully
       */
      function transfer(address _to, uint256 _value, bytes _data) public returns (bool) {
        require(_to != address(this));

        super.transfer(_to, _value);

        require(_to.call(_data));
        return true;
      }

      /**
         @dev Addition to ERC20 token methods. Transfer tokens from one address to
         another and make a contract call on the same transaction

         @param _from The address which you want to send tokens from
         @param _to The address which you want to transfer to
         @param _value The amout of tokens to be transferred
         @param _data ABI-encoded contract call to call `_to` address.

         @return true if the call function was executed successfully
       */
      function transferFrom(address _from, address _to, uint256 _value, bytes _data) public returns (bool) {
        require(_to != address(this));

        super.transferFrom(_from, _to, _value);

        require(_to.call(_data));
        return true;
      }

      /**
       * @dev Addition to StandardToken methods. Increase the amount of tokens that
       * an owner allowed to a spender and execute a call with the sent data.
       *
       * approve should be called when allowed[_spender] == 0. To increment
       * allowed value is better to use this function to avoid 2 calls (and wait until
       * the first transaction is mined)
       * From MonolithDAO Token.sol
       * @param _spender The address which will spend the funds.
       * @param _addedValue The amount of tokens to increase the allowance by.
       * @param _data ABI-encoded contract call to call `_spender` address.
       */
      function increaseApproval(address _spender, uint _addedValue, bytes _data) public returns (bool) {
        require(_spender != address(this));

        super.increaseApproval(_spender, _addedValue);

        require(_spender.call(_data));

        return true;
      }

      /**
       * @dev Addition to StandardToken methods. Decrease the amount of tokens that
       * an owner allowed to a spender and execute a call with the sent data.
       *
       * approve should be called when allowed[_spender] == 0. To decrement
       * allowed value is better to use this function to avoid 2 calls (and wait until
       * the first transaction is mined)
       * From MonolithDAO Token.sol
       * @param _spender The address which will spend the funds.
       * @param _subtractedValue The amount of tokens to decrease the allowance by.
       * @param _data ABI-encoded contract call to call `_spender` address.
       */
      function decreaseApproval(address _spender, uint _subtractedValue, bytes _data) public returns (bool) {
        require(_spender != address(this));

        super.decreaseApproval(_spender, _subtractedValue);

        require(_spender.call(_data));

        return true;
      }

    }

    contract BurnableToken is BasicToken {

      event Burn(address indexed burner, uint256 value);

      /**
       * @dev Burns a specific amount of tokens.
       * @param _value The amount of token to be burned.
       */
      function burn(uint256 _value) public {
        require(_value <= balances[msg.sender]);
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure

        address burner = msg.sender;
        balances[burner] = balances[burner].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        Burn(burner, _value);
        Transfer(burner, address(0), _value);
      }
    }

    contract MintableToken is StandardToken, Ownable {
      event Mint(address indexed to, uint256 amount);
      event MintFinished();

      bool public mintingFinished = false;


      modifier canMint() {
        require(!mintingFinished);
        _;
      }

      /**
       * @dev Function to mint tokens
       * @param _to The address that will receive the minted tokens.
       * @param _amount The amount of tokens to mint.
       * @return A boolean that indicates if the operation was successful.
       */
      function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
        totalSupply_ = totalSupply_.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        Mint(_to, _amount);
        Transfer(address(0), _to, _amount);
        return true;
      }

      /**
       * @dev Function to stop minting new tokens.
       * @return True if the operation was successful.
       */
      function finishMinting() onlyOwner canMint public returns (bool) {
        mintingFinished = true;
        MintFinished();
        return true;
      }
    }

    /**
     * @title DAOToken, based on zeppelin contract.
     * @dev ERC20 compatible token. It is a mintable and burnable token.
     */

    contract DAOToken is ERC827Token, MintableToken, BurnableToken {

        string public name;
        string public symbol;
        uint8 public constant decimals = 18;
        uint public cap;

        /**
        * @dev Constructor
        * @param _name - token name
        * @param _symbol - token symbol
        * @param _cap - token cap - 0 value means no cap
        */
        function DAOToken(string _name, string _symbol,uint _cap) public {
            name = _name;
            symbol = _symbol;
            cap = _cap;
        }

        /**
         * @dev Function to mint tokens
         * @param _to The address that will receive the minted tokens.
         * @param _amount The amount of tokens to mint.
         * @return A boolean that indicates if the operation was successful.
         */
        function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
            if (cap > 0)
                require(totalSupply_.add(_amount) <= cap);
            return super.mint(_to, _amount);
        }
    }