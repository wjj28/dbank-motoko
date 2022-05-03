import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"

// for the programs in ICP, a valid program consists of an actor expression: keyword actor
actor DBank{
//  Orthogonal persistance with stable keyword. It allows the value to keep the state
stable var currentValue: Float = 300;
//currentValue := 100;

// using Time library
stable var startTime = Time.now();
startTime:= Time.now();

// Debug.print(debug_show(startTime));


  // let id = 712312391238;
  // id := 123213; 


  // Debug.print("Hello");

// debug_show allows us to put a constant or a variable into print function 
  // Debug.print(debug_show(id));
 


// func to create functions in mo 
// private function: only accessible from within actor
// to make it public, just add the public keyword
public func topUp(amount: Float){
  currentValue += amount;
  Debug.print(debug_show(currentValue));

};
 
// topUp();
 
// Allow users to withdrawl an amount from the currentValue
// Decrease the currentValue by the amount
public func withdrawl(amount: Float)
{
  let tempValue: Float = currentValue - amount;
  if ( tempValue >= 0){
  currentValue-=amount;
  Debug.print(debug_show(currentValue));
    } else{
    Debug.print("Amount too large.Current value less than 0$. Please top up");
  }
  };

public query func checkBalance(): async Float {
  // read only operation
 return currentValue;

};


public func compound(){
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - startTime;
  let timeElapsedS = timeElapsedNS/ 1000000000;
  currentValue := currentValue * (1.01)** Float.fromInt(timeElapsedS);
  startTime:= currentTime;

}


// topUp();
}


// topUp and withdrawl take some time because they are considered UPDATE methods in ICP