Vending Machine

###Specification

Design a vending machine in code.

Once the product is selected and the appropriate amount of coins inserted 
- it should return the product.
- It should return change (coins) if inserted too much. 
- Change should be returned with the minimum amount of coins possible. 
- It should notify the customer when the selected product is out of stock. - It should return inserted coins in case it does not have enough change. 


###Technologies used

Ruby
RSPEC

###How to set it up

      git clone https://github.com/MoZahid775/Vending-Machine


###How to run it

      ruby driver.rb within project directory

###How to test it

      type 'rspec' within project directory


##Assumptions Made
     User Input is always valid
     Currency Values are only 5,3,2,1,0.5,0.25


##Other
Vending Machine is the main class 
    Vending Machine is initialized with default Products and Money values
    Lifecycle
        Vending Machine initialize
        List Products
        Pick Products
