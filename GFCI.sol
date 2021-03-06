/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GFCI at 0xe253bcad9b318328945e3dc25e279fc607f68639
*/
pragma solidity ^0.4.16;

contract GFCI {
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 
    _value);
    
    uint256 public totalSupply;
    
    string public name;                   //?????"My test token"
    uint8 public decimals;               //??token?????????????????3?????0.001??.
    string public symbol;               //token??,like MTT
    
    function GFCI(uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol) public {
        totalSupply = _initialAmount * 10 ** uint256(_decimalUnits);         // ??????
        balances[msg.sender] = totalSupply; // ??token??????????????????????????????
        
        name = _tokenName;                   
        decimals = _decimalUnits;          
        symbol = _tokenSymbol;
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        //??totalSupply ??????? (2^256 - 1).
        //??????????????token??????????????????
        require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
        require(_to != 0x0);
        balances[msg.sender] -= _value;//???????????token??_value
        balances[_to] += _value;//???????token??_value
        emit Transfer(msg.sender, _to, _value);//????????
        return true;
    }


    function transferFrom(address _from, address _to, uint256 _value) public returns 
    (bool success) {
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
        balances[_to] += _value;//??????token??_value
        balances[_from] -= _value; //????_from??token??_value
        allowed[_from][msg.sender] -= _value;//??????????_from????????_value
        emit Transfer(_from, _to, _value);//????????
        return true;
    }
    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balances[_owner];
    }


    function approve(address _spender, uint256 _value) public returns (bool success)   
    { 
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];//??_spender?_owner????token?
    }
   
}