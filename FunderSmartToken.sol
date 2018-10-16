/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FunderSmartToken at 0x4E6f3CEfbBE715a858644100f0Aad364832596d1
*/
pragma solidity ^0.4.23;
pragma experimental "v0.5.0";
pragma experimental ABIEncoderV2;

library AddressExtension {

  function isValid(address _address) internal pure returns (bool) {
    return 0 != _address;
  }

  function isAccount(address _address) internal view returns (bool result) {
    assembly {
      result := iszero(extcodesize(_address))
    }
  }

  function toBytes(address _address) internal pure returns (bytes b) {
   assembly {
      let m := mload(0x40)
      mstore(add(m, 20), xor(0x140000000000000000000000000000000000000000, _address))
      mstore(0x40, add(m, 52))
      b := m
    }
  }
}

library Math {

  struct Fraction {
    uint256 numerator;
    uint256 denominator;
  }

  function mul(uint256 a, uint256 b) internal pure returns (uint256 r) {
    r = a * b;
    require((a == 0) || (r / a == b));
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256 r) {
    r = a / b;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256 r) {
    require((r = a - b) <= a);
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256 r) {
    require((r = a + b) >= a);
  }

  function min(uint256 x, uint256 y) internal pure returns (uint256 r) {
    return x <= y ? x : y;
  }

  function max(uint256 x, uint256 y) internal pure returns (uint256 r) {
    return x >= y ? x : y;
  }

  function mulDiv(uint256 value, uint256 m, uint256 d) internal pure returns (uint256 r) {
    r = value * m;
    if (r / value == m) {
      r /= d;
    } else {
      r = mul(value / d, m);
    }
  }

  function mulDivCeil(uint256 value, uint256 m, uint256 d) internal pure returns (uint256 r) {
    r = value * m;
    if (r / value == m) {
      r /= d;
      if (r % d != 0) {
        r += 1;
      }
    } else {
      r = mul(value / d, m);
      if (value % d != 0) {
        r += 1;
      }
    }
  }

  function mul(uint256 x, Fraction memory f) internal pure returns (uint256) {
    return mulDiv(x, f.numerator, f.denominator);
  }

  function mulCeil(uint256 x, Fraction memory f) internal pure returns (uint256) {
    return mulDivCeil(x, f.numerator, f.denominator);
  }

  function div(uint256 x, Fraction memory f) internal pure returns (uint256) {
    return mulDiv(x, f.denominator, f.numerator);
  }

  function divCeil(uint256 x, Fraction memory f) internal pure returns (uint256) {
    return mulDivCeil(x, f.denominator, f.numerator);
  }
}

contract FsTKAllocation {

  function initialize(uint256 _vestedAmount) public;
}

contract FsTKAuthority {

  function isAuthorized(address sender, address _contract, bytes data) public view returns (bool);
  function isApproved(bytes32 hash, uint256 approveTime, bytes approveToken) public view returns (bool);
  function validate() public pure returns (bool);
}

contract Authorizable {

  event SetFsTKAuthority(FsTKAuthority indexed _address);

  modifier onlyFsTKAuthorized {
    require(fstkAuthority.isAuthorized(msg.sender, this, msg.data));
    _;
  }
  modifier onlyFsTKApproved(bytes32 hash, uint256 approveTime, bytes approveToken) {
    require(fstkAuthority.isApproved(hash, approveTime, approveToken));
    _;
  }

  FsTKAuthority internal fstkAuthority;

  constructor(FsTKAuthority _fstkAuthority) internal {
    fstkAuthority = _fstkAuthority;
  }

  function setFsTKAuthority(FsTKAuthority _fstkAuthority) public onlyFsTKAuthorized {
    require(_fstkAuthority.validate());
    emit SetFsTKAuthority(fstkAuthority = _fstkAuthority);
  }
}

contract ERC20 {

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);

  function balanceOf(address owner) public view returns (uint256);
  function allowance(address owner, address spender) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
}

contract SecureERC20 is ERC20 {

  event SetERC20ApproveChecking(bool approveChecking);

  function approve(address spender, uint256 expectedValue, uint256 newValue) public returns (bool);
  function increaseAllowance(address spender, uint256 value) public returns (bool);
  function decreaseAllowance(address spender, uint256 value, bool strict) public returns (bool);
  function setERC20ApproveChecking(bool approveChecking) public;
}

contract FsTKToken {

  event SetupDirectDebit(address indexed debtor, address indexed receiver, DirectDebitInfo info);
  event TerminateDirectDebit(address indexed debtor, address indexed receiver);
  event WithdrawDirectDebitFailure(address indexed debtor, address indexed receiver);

  event SetMetadata(string metadata);
  event SetLiquid(bool liquidity);
  event SetDelegate(bool isDelegateEnable);
  event SetDirectDebit(bool isDirectDebitEnable);

  struct DirectDebitInfo {
    uint256 amount;
    uint256 startTime;
    uint256 interval;
  }
  struct DirectDebit {
    DirectDebitInfo info;
    uint256 epoch;
  }
  struct Instrument {
    uint256 allowance;
    DirectDebit directDebit;
  }
  struct Account {
    uint256 balance;
    uint256 nonce;
    mapping (address => Instrument) instruments;
  }

  function spendableAllowance(address owner, address spender) public view returns (uint256);
  function transfer(uint256[] data) public returns (bool);
  function transferAndCall(address to, uint256 value, bytes data) public payable returns (bool);
  function delegateTransferAndCall(
    uint256 nonce,
    uint256 gasAmount,
    address to,
    uint256 value,
    bytes data,
    uint8 v,
    bytes32 r,
    bytes32 s
  ) public returns (bool);

  function directDebitOf(address debtor, address receiver) public view returns (DirectDebit);
  function setupDirectDebit(address receiver, DirectDebitInfo info) public returns (bool);
  function terminateDirectDebit(address receiver) public returns (bool);
  function withdrawDirectDebit(address debtor) public returns (bool);
  function withdrawDirectDebit(address[] debtors, bool strict) public returns (bool result);
}

contract AbstractToken is SecureERC20, FsTKToken {
  using AddressExtension for address;
  using Math for uint256;

  modifier liquid {
    require(isLiquid);
     _;
  }
  modifier canUseDirectDebit {
    require(isDirectDebitEnable);
     _;
  }

  bool public erc20ApproveChecking;
  bool public isLiquid = true;
  bool public isDelegateEnable;
  bool public isDirectDebitEnable;
  string public metadata;
  mapping(address => Account) internal accounts;

  constructor(string _metadata) public {
    metadata = _metadata;
  }

  function balanceOf(address owner) public view returns (uint256) {
    return accounts[owner].balance;
  }

  function allowance(address owner, address spender) public view returns (uint256) {
    return accounts[owner].instruments[spender].allowance;
  }

  function transfer(address to, uint256 value) public liquid returns (bool) {
    Account storage senderAccount = accounts[msg.sender];
    uint256 senderBalance = senderAccount.balance;
    require(value <= senderBalance);

    senderAccount.balance = senderBalance - value;
    accounts[to].balance += value;

    emit Transfer(msg.sender, to, value);
    return true;
  }

  function transferFrom(address from, address to, uint256 value) public liquid returns (bool) {
    Account storage fromAccount = accounts[from];
    uint256 fromBalance = fromAccount.balance;
    Instrument storage senderInstrument = fromAccount.instruments[msg.sender];
    uint256 senderAllowance = senderInstrument.allowance;
    require(value <= fromBalance);
    require(value <= senderAllowance);

    fromAccount.balance = fromBalance - value;
    senderInstrument.allowance = senderAllowance - value;
    accounts[to].balance += value;

    emit Transfer(from, to, value);
    return true;
  }

  function approve(address spender, uint256 value) public returns (bool) {
    Instrument storage spenderInstrument = accounts[msg.sender].instruments[spender];
    if (erc20ApproveChecking) {
      require((value == 0) || (spenderInstrument.allowance == 0));
    }
    spenderInstrument.allowance = value;

    emit Approval(msg.sender, spender, value);
    return true;
  }

  function setERC20ApproveChecking(bool approveChecking) public {
    emit SetERC20ApproveChecking(erc20ApproveChecking = approveChecking);
  }

  function approve(address spender, uint256 expectedValue, uint256 newValue) public returns (bool) {
    Instrument storage spenderInstrument = accounts[msg.sender].instruments[spender];
    require(spenderInstrument.allowance == expectedValue);

    spenderInstrument.allowance = newValue;

    emit Approval(msg.sender, spender, newValue);
    return true;
  }

  function increaseAllowance(address spender, uint256 value) public returns (bool) {
    Instrument storage spenderInstrument = accounts[msg.sender].instruments[spender];

    uint256 newValue = spenderInstrument.allowance.add(value);
    spenderInstrument.allowance = newValue;

    emit Approval(msg.sender, spender, newValue);
    return true;
  }

  function decreaseAllowance(address spender, uint256 value, bool strict) public returns (bool) {
    Instrument storage spenderInstrument = accounts[msg.sender].instruments[spender];

    uint256 currentValue = spenderInstrument.allowance;
    uint256 newValue;
    if (strict) {
      newValue = currentValue.sub(value);
    } else if (value < currentValue) {
      newValue = currentValue - value;
    }
    spenderInstrument.allowance = newValue;

    emit Approval(msg.sender, spender, newValue);
    return true;
  }

  function setMetadata0(string _metadata) internal {
    emit SetMetadata(metadata = _metadata);
  }

  function setLiquid0(bool liquidity) internal {
    emit SetLiquid(isLiquid = liquidity);
  }

  function setDelegate(bool delegate) public {
    emit SetDelegate(isDelegateEnable = delegate);
  }

  function setDirectDebit(bool directDebit) public {
    emit SetDirectDebit(isDirectDebitEnable = directDebit);
  }

  function spendableAllowance(address owner, address spender) public view returns (uint256) {
    Account storage ownerAccount = accounts[owner];
    return Math.min(
      ownerAccount.instruments[spender].allowance,
      ownerAccount.balance
    );
  }

  function transfer(uint256[] data) public liquid returns (bool) {
    Account storage senderAccount = accounts[msg.sender];
    uint256 totalValue;
    for (uint256 i = 0; i < data.length; i++) {
      address receiver = address(data[i] >> 96);
      uint256 value = data[i] & 0xffffffffffffffffffffffff;

      totalValue = totalValue.add(value);
      accounts[receiver].balance += value;

      emit Transfer(msg.sender, receiver, value);
    }

    uint256 senderBalance = senderAccount.balance;
    require(totalValue <= senderBalance);
    senderAccount.balance = senderBalance - totalValue;

    return true;
  }

  function transferAndCall(address to, uint256 value, bytes data) public payable liquid returns (bool) {
    require(to != address(this));
    require(transfer(to, value));
    require(data.length >= 68);
    assembly {
        mstore(add(data, 36), value)
        mstore(add(data, 68), caller)
    }
    require(to.call.value(msg.value)(data));
    return true;
  }

  function delegateTransferAndCall(
    uint256 nonce,
    uint256 gasAmount,
    address to,
    uint256 value,
    bytes data,
    uint8 v,
    bytes32 r,
    bytes32 s
  )
    public
    liquid
    returns (bool)
  {
    require(isDelegateEnable);
    require(to != address(this));

    address signer = ecrecover(
      keccak256(nonce, gasAmount, to, value, data),
      v,
      r,
      s
    );
    Account storage signerAccount = accounts[signer];
    require(nonce == signerAccount.nonce);
    signerAccount.nonce = nonce.add(1);
    uint256 signerBalance = signerAccount.balance;
    uint256 total = value.add(gasAmount);
    require(total <= signerBalance);

    signerAccount.balance = signerBalance - total;
    accounts[to].balance += value;
    emit Transfer(signer, to, value);
    accounts[msg.sender].balance += gasAmount;
    emit Transfer(signer, msg.sender, gasAmount);

    if (!to.isAccount()) {
      require(data.length >= 68);
      assembly {
        mstore(add(data, 36), value)
        mstore(add(data, 68), signer)
      }
      require(to.call(data));
    }

    return true;
  }

  function directDebitOf(address debtor, address receiver) public view returns (DirectDebit) {
    return accounts[debtor].instruments[receiver].directDebit;
  }

  function setupDirectDebit(
    address receiver,
    DirectDebitInfo info
  )
    public
    returns (bool)
  {
    accounts[msg.sender].instruments[receiver].directDebit = DirectDebit({
      info: info,
      epoch: 0
    });

    emit SetupDirectDebit(msg.sender, receiver, info);
    return true;
  }

  function terminateDirectDebit(address receiver) public returns (bool) {
    delete accounts[msg.sender].instruments[receiver].directDebit;

    emit TerminateDirectDebit(msg.sender, receiver);
    return true;
  }

  function calculateTotalDirectDebitAmount(uint256 amount, uint256 epochNow, uint256 epochLast) pure private returns (uint256) {
    require(amount > 0);
    require(epochNow > epochLast);
    return (epochNow - epochLast).mul(amount);
  }

  function withdrawDirectDebit(address debtor) public liquid canUseDirectDebit returns (bool) {
    Account storage debtorAccount = accounts[debtor];
    uint256 debtorBalance = debtorAccount.balance;
    DirectDebit storage directDebit = debtorAccount.instruments[msg.sender].directDebit;
    uint256 epoch = block.timestamp.sub(directDebit.info.startTime) / directDebit.info.interval + 1;
    uint256 amount = calculateTotalDirectDebitAmount(directDebit.info.amount, epoch, directDebit.epoch);
    require(amount <= debtorBalance);

    debtorAccount.balance = debtorBalance - amount;
    accounts[msg.sender].balance += amount;
    directDebit.epoch = epoch;

    emit Transfer(debtor, msg.sender, amount);
    return true;
  }

  function withdrawDirectDebit(address[] debtors, bool strict) public liquid canUseDirectDebit returns (bool result) {
    Account storage receiverAccount = accounts[msg.sender];
    result = true;

    for (uint256 i = 0; i < debtors.length; i++) {
      address debtor = debtors[i];
      Account storage debtorAccount = accounts[debtor];
      uint256 debtorBalance = debtorAccount.balance;
      DirectDebit storage directDebit = debtorAccount.instruments[msg.sender].directDebit;
      uint256 epoch = block.timestamp.sub(directDebit.info.startTime) / directDebit.info.interval + 1;
      uint256 amount = calculateTotalDirectDebitAmount(directDebit.info.amount, epoch, directDebit.epoch);

      if (amount > debtorBalance) {
        if (strict) {
          revert();
        }
        result = false;
        emit WithdrawDirectDebitFailure(debtor, msg.sender);
      } else {
        debtorAccount.balance = debtorBalance - amount;
        receiverAccount.balance += amount;
        directDebit.epoch = epoch;

        emit Transfer(debtor, msg.sender, amount);
      }
    }
  }
}

contract FunderSmartToken is AbstractToken, Authorizable {

  string public constant name = "Funder Smart Token";
  string public constant symbol = "FST";
  uint256 public constant totalSupply = 330000000 ether;
  uint8 public constant decimals = 18;

  constructor(
    FsTKAuthority _fstkAuthority,
    string _metadata,
    address coldWallet,
    FsTKAllocation allocation
  )
    AbstractToken(_metadata)
    Authorizable(_fstkAuthority)
    public
  {
    uint256 vestedAmount = totalSupply / 12;
    accounts[allocation].balance = vestedAmount;
    emit Transfer(address(0), allocation, vestedAmount);
    allocation.initialize(vestedAmount);

    uint256 releaseAmount = totalSupply - vestedAmount;
    accounts[coldWallet].balance = releaseAmount;

    emit Transfer(address(0), coldWallet, releaseAmount);
  }

  function setMetadata(string infoUrl) public onlyFsTKAuthorized {
    setMetadata0(infoUrl);
  }

  function setLiquid(bool liquidity) public onlyFsTKAuthorized {
    setLiquid0(liquidity);
  }

  function setERC20ApproveChecking(bool approveChecking) public onlyFsTKAuthorized {
    AbstractToken.setERC20ApproveChecking(approveChecking);
  }

  function setDelegate(bool delegate) public onlyFsTKAuthorized {
    AbstractToken.setDelegate(delegate);
  }

  function setDirectDebit(bool directDebit) public onlyFsTKAuthorized {
    AbstractToken.setDirectDebit(directDebit);
  }

  function transferToken(ERC20 erc20, address to, uint256 value) public onlyFsTKAuthorized {
    erc20.transfer(to, value);
  }
}