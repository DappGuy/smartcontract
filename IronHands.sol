/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract IronHands at 0x134decfcc18a98f721496d83a4622e57e54f0c6b
*/
pragma solidity ^0.4.21;

/**
 * 
 * 
 *   __________                                                          
 *   \______   \ ____   ____   _____   ________________    ____    ____  
 *    |    |  _//  _ \ /  _ \ /     \_/ __ \_  __ \__  \  /    \  / ___\ 
 *    |    |   (  <_> |  <_> )  Y Y  \  ___/|  | \// __ \|   |  \/ /_/  >
 *    |______  /\____/ \____/|__|_|  /\___  >__|  (____  /___|  /\___  / 
 *           \/                    \/     \/           \/     \//_____/  
 *          .____    .__             .__    .___.__  __                  
 *          |    |   |__| ________ __|__| __| _/|__|/  |_ ___.__.        
 *          |    |   |  |/ ____/  |  \  |/ __ | |  \   __<   |  |        
 *          |    |___|  < <_|  |  |  /  / /_/ | |  ||  |  \___  |        
 *          |_______ \__|\__   |____/|__\____ | |__||__|  / ____|        
 *                  \/      |__|             \/           \/             
 *    _____          __               .__    ___________                .___
 *   /     \  __ ___/  |_ __ _______  |  |   \_   _____/_ __  ____    __| _/
 *  /  \ /  \|  |  \   __\  |  \__  \ |  |    |    __)|  |  \/    \  / __ | 
 * /    Y    \  |  /|  | |  |  // __ \|  |__  |     \ |  |  /   |  \/ /_/ | 
 * \____|__  /____/ |__| |____/(____  /____/  \___  / |____/|___|  /\____ | 
 *         \/                       \/            \/             \/      \/ 
 *     ___________            __               .__                          
 *     \_   _____/___ _____ _/  |_ __ _________|__| ____    ____            
 *      |    __)/ __ \\__  \\   __\  |  \_  __ \  |/    \  / ___\           
 *      |     \\  ___/ / __ \|  | |  |  /|  | \/  |   |  \/ /_/  >          
 *      \___  / \___  >____  /__| |____/ |__|  |__|___|  /\___  /           
 *          \/      \/     \/                          \//_____/           
 *                   _          _           _            _                      
 *                  /\ \       /\ \        /\ \         /\ \     _              
 *                  \ \ \     /  \ \      /  \ \       /  \ \   /\_\            
 *                  /\ \_\   / /\ \ \    / /\ \ \     / /\ \ \_/ / /            
 *                 / /\/_/  / / /\ \_\  / / /\ \ \   / / /\ \___/ /             
 *                / / /    / / /_/ / / / / /  \ \_\ / / /  \/____/              
 *               / / /    / / /__\/ / / / /   / / // / /    / / /               
 *              / / /    / / /_____/ / / /   / / // / /    / / /                
 *          ___/ / /__  / / /\ \ \  / / /___/ / // / /    / / /                 
 *         /\__\/_/___\/ / /  \ \ \/ / /____\/ // / /    / / /                  
 *         \/_________/\/_/    \_\/\/_________/ \/_/     \/_/                   
 *          _       _    _                   _             _            _        
 *         / /\    / /\ / /\                /\ \     _    /\ \         / /\      
 *        / / /   / / // /  \              /  \ \   /\_\ /  \ \____   / /  \     
 *       / /_/   / / // / /\ \            / /\ \ \_/ / // /\ \_____\ / / /\ \__  
 *      / /\ \__/ / // / /\ \ \          / / /\ \___/ // / /\/___  // / /\ \___\ 
 *     / /\ \___\/ // / /  \ \ \        / / /  \/____// / /   / / / \ \ \ \/___/ 
 *    / / /\/___/ // / /___/ /\ \      / / /    / / // / /   / / /   \ \ \       
 *   / / /   / / // / /_____/ /\ \    / / /    / / // / /   / / /_    \ \ \      
 *  / / /   / / // /_________/\ \ \  / / /    / / / \ \ \__/ / //_/\__/ / /      
 * / / /   / / // / /_       __\ \_\/ / /    / / /   \ \___\/ / \ \/___/ /       
 * \/_/    \/_/ \_\___\     /____/_/\/_/     \/_/     \/_____/   \_____\/        
 *                                                                                        
 *                          .___ __________________ ________                
 *       _____    ____    __| _/ \______   \_____  \\______ \               
 *       \__  \  /    \  / __ |   |     ___/ _(__  < |    |  \              
 *        / __ \|   |  \/ /_/ |   |    |    /       \|    `   \             
 *       (____  /___|  /\____ |   |____|   /______  /_______  /             
 *            \/     \/      \/                   \/        \/                    
 *
 * ATTENTION!
 * 
 * This code? IS NOT DESIGNED FOR ACTUAL USE.
 * 
 * The author of this code really wishes you wouldn't send your ETH to it.
 * 
 * No, seriously. It's probablly illegal anyway. So don't do it.
 * 
 * Let me repeat that: Don't actually send money to this contract. You are 
 * likely breaking several local and national laws in doing so.
 * 
 * This code is intended to educate. Nothing else. If you use it, expect S.W.A.T 
 * teams at your door. I wrote this code because I wanted to experiment
 * with smart contracts, and I think code should be open source. So consider
 * it public domain, No Rights Reserved. Participating in pyramid schemes
 * is genuinely illegal so just don't even think about going beyond
 * reading the code and understanding how it works.
 * 
 * Seriously. I'm not kidding. It's probablly broken in some critical way anyway
 * and will suck all your money out your wallet, install a virus on your computer
 * sleep with your wife, kidnap your children and sell them into slavery,
 * make you forget to file your taxes, and give you cancer.
 * 
 * So.... tl;dr: This contract sucks, don't send money to it.
 * 
 * What it does:
 * 
 * It takes 50% of the ETH in it and buys tokens.
 * It takes 50% of the ETH in it and pays back depositors.
 * Depositors get in line and are paid out in order of deposit, plus the deposit
 * percent.
 * The tokens collect dividends, which in turn pay into the payout pool
 * to be split 50/50.
 * 
 * If your seeing this contract in it's initial configuration, it should be
 * set to 200% (double deposits), and pointed at PoWH:
 * 0xB3775fB83F7D12A36E0475aBdD1FCA35c091efBe
 * 
 * But you should verify this for yourself.
 *  
 *  
 */

contract ERC20Interface {
    function transfer(address to, uint256 tokens) public returns (bool success);
}

contract POWH {
    
    function buy(address) public payable returns(uint256);
    function withdraw() public;
    function myTokens() public view returns(uint256);
    function myDividends(bool) public view returns(uint256);
}

contract Owned {
    address public owner;
    address public ownerCandidate;

    function Owned() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function changeOwner(address _newOwner) public onlyOwner {
        ownerCandidate = _newOwner;
    }
    
    function acceptOwnership() public {
        require(msg.sender == ownerCandidate);  
        owner = ownerCandidate;
    }
    
}

contract IronHands is Owned {
    
    /**
     * Modifiers
     */
     
    /**
     * Only owners are allowed.
     */
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    /**
     * The tokens can never be stolen.
     */
    modifier notPowh(address aContract){
        require(aContract != address(weak_hands));
        _;
    }
   
    /**
     * Events
     */
    event Deposit(uint256 amount, address depositer);
    event Purchase(uint256 amountSpent, uint256 tokensReceived);
    event Payout(uint256 amount, address creditor);
    event Dividends(uint256 amount);
    event Donation(uint256 amount, address donator);
    event ContinuityBreak(uint256 position, address skipped, uint256 amount);
    event ContinuityAppeal(uint256 oldPosition, uint256 newPosition, address appealer);

    /**
     * Structs
     */
    struct Participant {
        address etherAddress;
        uint256 payout;
    }

    //Total ETH managed over the lifetime of the contract
    uint256 throughput;
    //Total ETH received from dividends
    uint256 dividends;
    //The percent to return to depositers. 100 for 00%, 200 to double, etc.
    uint256 public multiplier;
    //Where in the line we are with creditors
    uint256 public payoutOrder = 0;
    //How much is owed to people
    uint256 public backlog = 0;
    //The creditor line
    Participant[] public participants;
    //The people who have been skipped
    mapping(address => uint256[]) public appeals;
    //Their position in line to skip
    mapping(address => uint256) public appealPosition;
    //How much each person is owed
    mapping(address => uint256) public creditRemaining;
    //What we will be buying
    POWH weak_hands;

    /**
     * Constructor
     */
    function IronHands(uint multiplierPercent, address powh) public {
        multiplier = multiplierPercent;
        weak_hands = POWH(powh);
    }
    
    
    /**
     * Fallback function allows anyone to send money for the cost of gas which
     * goes into the pool. Used by withdraw/dividend payouts so it has to be cheap.
     */
    function() payable public {
    }
    
    /**
     * Deposit ETH to get in line to be credited back the multiplier as a percent,
     * add that ETH to the pool, get the dividends and put them in the pool,
     * then pay out who we owe and buy more tokens.
     */ 
    function deposit() payable public {
        //You have to send more than 10 wei.
        require(msg.value > 10);
        //Compute how much to pay them
        uint256 amountCredited = (msg.value * multiplier) / 100;
        //Get in line to be paid back.
        participants.push(Participant(msg.sender, amountCredited));
        //Increase the backlog by the amount owed
        backlog += amountCredited;
        //Increase the amount owed to this address
        creditRemaining[msg.sender] += amountCredited;
        //Emit a deposit event.
        emit Deposit(msg.value, msg.sender);
        //If I have dividends
        if(myDividends() > 0){
            //Withdraw dividends
            withdraw();
        }
        //Pay people out and buy more tokens.
        payout();
    }
    
    /**
     * Take 50% of the money and spend it on tokens, which will pay dividends later.
     * Take the other 50%, and use it to pay off depositors.
     */
    function payout() public {
        //Take everything in the pool
        uint balance = address(this).balance;
        //It needs to be something worth splitting up
        require(balance > 1);
        //Increase our total throughput
        throughput += balance;
        //Split it into two parts
        uint investment = balance / 2;
        //Take away the amount we are investing from the amount to send
        balance -= investment;
        //Invest it in more tokens.
        uint256 tokens = weak_hands.buy.value(investment).gas(1000000)(msg.sender);
        //Record that tokens were purchased
        emit Purchase(investment, tokens);
        //While we still have money to send
        while (balance > 0) {
            //Either pay them what they are owed or however much we have, whichever is lower.
            uint payoutToSend = balance < participants[payoutOrder].payout ? balance : participants[payoutOrder].payout;
            //if we have something to pay them
            if(payoutToSend > 0){
                //credit their account the amount they are being paid
                participants[payoutOrder].payout -= payoutToSend;
                //subtract how much we've spent
                balance -= payoutToSend;
                //subtract the amount paid from the amount owed
                backlog -= payoutToSend;
                //subtract the amount remaining they are owed
                creditRemaining[participants[payoutOrder].etherAddress] -= payoutToSend;
                //Try and pay them
                participants[payoutOrder].etherAddress.call.value(payoutToSend).gas(1000000)();
                //Record that they were paid
                emit Payout(payoutToSend, participants[payoutOrder].etherAddress);
            }
            //If we still have balance left over
            if(balance > 0){
                // go to the next person in line
                payoutOrder += 1;
            }
            //If we've run out of people to pay, stop
            if(payoutOrder >= participants.length){
                return;
            }
        }
    }
    
    /**
     * Number of tokens the contract owns.
     */
    function myTokens() public view returns(uint256){
        return weak_hands.myTokens();
    }
    
    /**
     * Number of dividends owed to the contract.
     */
    function myDividends() public view returns(uint256){
        return weak_hands.myDividends(true);
    }
    
    /**
     * Number of dividends received by the contract.
     */
    function totalDividends() public view returns(uint256){
        return dividends;
    }
    
    
    /**
     * Request dividends be paid out and added to the pool.
     */
    function withdraw() public {
        uint256 balance = address(this).balance;
        weak_hands.withdraw.gas(1000000)();
        uint256 dividendsPaid = address(this).balance - balance;
        dividends += dividendsPaid;
        emit Dividends(dividendsPaid);
    }
    
    /**
     * A charitible contribution will be added to the pool.
     */
    function donate() payable public {
        emit Donation(msg.value, msg.sender);
    }
    
    /**
     * Number of participants who are still owed.
     */
    function backlogLength() public view returns (uint256){
        return participants.length - payoutOrder;
    }
    
    /**
     * Total amount still owed in credit to depositors.
     */
    function backlogAmount() public view returns (uint256){
        return backlog;
    } 
    
    /**
     * Total number of deposits in the lifetime of the contract.
     */
    function totalParticipants() public view returns (uint256){
        return participants.length;
    }
    
    /**
     * Total amount of ETH that the contract has delt with so far.
     */
    function totalSpent() public view returns (uint256){
        return throughput;
    }
    
    /**
     * Amount still owed to an individual address
     */
    function amountOwed(address anAddress) public view returns (uint256) {
        return creditRemaining[anAddress];
    }
     
     /**
      * Amount owed to this person.
      */
    function amountIAmOwed() public view returns (uint256){
        return amountOwed(msg.sender);
    }
    
    /**
     * A trap door for when someone sends tokens other than the intended ones so the overseers can decide where to send them.
     */
    function transferAnyERC20Token(address tokenAddress, address tokenOwner, uint tokens) public onlyOwner notPowh(tokenAddress) returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(tokenOwner, tokens);
    }
    
    /**
     * This function is potentially dangerous and should never be used except in extreme cases.
     * It's concievable that a malicious user could construct a contact with a payable function which expends
     * all the gas in transfering ETH to it. Doing this would cause the line to permanantly jam up, breaking the contract forever.
     * Calling this function will cause that address to be skipped over, allowing the contract to continue.
     * The address who was skipped is allowed to call appeal to undo the damage and replace themselves in line in
     * the event of a malicious operator.
     */
    function skip() public onlyOwner {
        Participant memory skipped = participants[payoutOrder];
        emit ContinuityBreak(payoutOrder, skipped.etherAddress, skipped.payout);
        if(appeals[skipped.etherAddress].length == appealPosition[skipped.etherAddress]){
            appeals[skipped.etherAddress].push(payoutOrder);
        }else{
            appeals[skipped.etherAddress][appealPosition[skipped.etherAddress]] = payoutOrder;
        }
        appealPosition[skipped.etherAddress] += 1;
        payoutOrder += 1;
    }

    /**
     * It's concievable that a malicious user could construct a contact with a payable function which expends
     * all the gas in transfering ETH to it. Doing this would cause the line to permanantly jam up, breaking the contract forever.
     * Calling this function will cause the line to be backed up to the skipped person's position.
     * It can only be done by the person who was skipped.
     */
    function appealSkip() public {
        require(appealPosition[msg.sender] > 0);
        appealPosition[msg.sender] -= 1;
        uint appeal = appeals[msg.sender][appealPosition[msg.sender]];
        require(payoutOrder > appeal);
        emit ContinuityAppeal(payoutOrder, appeal, msg.sender);
        payoutOrder = appeal;
    }
}