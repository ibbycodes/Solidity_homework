pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable employee_one; // ceo
    address payable employee_two; // cto
    address payable employee_three; // bob
    address payable bank; // this is where the money will be coming in from and remainders returning to

    constructor(address payable _one, address payable _two, address payable _three) public {
        bank = msg.sender;
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;
        
        //uint amountone;
        //uint amounttwo;
        //uint amountthree;

        // @TODO: Calculate and transfer the distribution percentage
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        //amountone = points * 60;
        //amounttwo = points * 25;
        //amountthree = points * 15;
        
        //employee_one.transfer(amountone)
        //employee_two.transfer(amounttwo)
        //employee_three.transfer(amountthree)
        //total = amountone+amounttwo+amountthree;
        // Step 2: Add the `amount` to `total` to keep a running total
        //total
        
        
        //Cleaner way of sending the funds rather than doing it individually 
        amount = points*60;
        total+=amount; 
        employee_one.transfer(amount);
        
        amount = points*25;
        total+=amount;
        employee_two.transfer(amount);
        
        amount=points*15;
        total+=amount;
        employee_three.transfer(amount);    
        
     
        employee_one.transfer(msg.value - total); // ceo gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}
