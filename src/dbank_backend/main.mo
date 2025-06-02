import Debug "mo:base/Debug";
//import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank { //actor class
  stable var currentValue : Float = 700; //stable keyword for persistence
  //currentValue := 300; //:= set equal to, re-assign variables, comment out in order to have orthogonal persistence

  stable var startTime = Time.now();

  let id = 77; //let is const in mokoto

  //Debug.print("Hello World")
  Debug.print("----------New Execution------------");
  Debug.print(debug_show(currentValue));
  Debug.print(debug_show(id));

  public func topUp(amount : Float) { //: Nat is the data type, Nat is a natrual number (non-negative whole number) //INT is integer
    currentValue += amount;
    Debug.print("New currentValue: " # debug_show(currentValue));
  };

  public func withdraw(amount : Float){
    currentValue -= amount;
    Debug.print("New currentValue: " # debug_show(currentValue));
  };

  public query func checkBalance(): async Float{
    return currentValue
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsed = currentTime - startTime;
    let timeElapsedSeconds = timeElapsed / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedSeconds));

    startTime := currentTime;
  }

  //topUp();
  //call a function within cmd line: dfx canister call <project name> <function> (params)
  //dfx canister call dbank_backend topUp

  //Candid UI -> front end interface for the functions that we create, think of it as swagger
  //dfx canister id __Candid_UI -> cmd command to get cannister Id
  //in front end it will ask for canister id (this is different than URL one)
  //dfx canister id <project name>
  //dfx canister id dbank_backend
  //take id and use that in front end to get to the Candid UI or use link in seocnd console
  //http://127.0.0.1:4943/?canisterId=vizcg-th777-77774-qaaea-cai&id=ucwa4-rx777-77774-qaada-cai

  //if (){
    //same syntax as js
  //}
}