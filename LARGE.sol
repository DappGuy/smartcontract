/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LARGE at 0x852c1bab0d9ed7158f69c032c0636677fdec04d9
*/
pragma solidity ^0.4.4;

contract Token 
{

    function totalSupply() constant returns (uint256 supply) {}

    function balanceOf(address _owner) constant returns (uint256 balance) {}

    function transfer(address _to, uint256 _value) returns (bool success) {}

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}

    function approve(address _spender, uint256 _value) returns (bool success) {}

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}


contract StandardToken is Token 
{

    function transfer(address _to, uint256 _value) returns (bool success) 
    {

        if (balances[msg.sender] >= _value && _value > 0) 
        {
            balances[msg.sender] -= _value;
            
            balances[_to] += _value;
            
            Transfer(msg.sender, _to, _value);
            
            return true;
        } 
        else 
        { 
            return false; 
        }

    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) 
    {

        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) 
        {
            balances[_to] += _value;
            
            balances[_from] -= _value;
            
            allowed[_from][msg.sender] -= _value;
            
            Transfer(_from, _to, _value);
            
            return true;
        } 
        else 
        { 
            return false; 
        }
    }

    function balanceOf(address _owner) constant returns (uint256 balance) 
    {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) returns (bool success) 
    {
        allowed[msg.sender][_spender] = _value;
        
        Approval(msg.sender, _spender, _value);
        
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) 
    {
      return allowed[_owner][_spender];
    }

    mapping (address => uint256) balances;
    
    mapping (address => mapping (address => uint256)) allowed;
    
    uint256 public totalSupply;
}



contract LARGE is StandardToken 
{

    function () { revert(); }

    string public name = "LARGE"; 
    
    uint8  public decimals = 0;               
    
    string public symbol = "G";
    
    string public version = "2.0"; 


    function LARGE ()       
    {
        balances[msg.sender] = 8888888888888888;
        
        totalSupply = 8888888888888888;
        
        name = "LARGE";
        
        decimals = 0;
        
        symbol = "G";
    }


    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success)
    {
   
        allowed[msg.sender][_spender] = _value;
        
        Approval(msg.sender, _spender, _value);

        if(!_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) 
        
        { revert(); }
        
        return true;
    }
}