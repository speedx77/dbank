import Debug "mo:base/Debug";
import Int "mo:base/Int";

actor DBank { //actor class
  var currentValue : Int = 700;
  currentValue := 300; //:= set equal to, re-assign variables

  let id = 77; //let is const in mokoto

  //Debug.print("Hello World")
  Debug.print("----------New Execution------------");
  Debug.print(debug_show(currentValue));
  Debug.print(debug_show(id));

  public func topUp(amount : Nat) { //: Nat is the data type, Nat is a natrual number (non-negative whole number) //INT is integer
    currentValue += 1;
    Debug.print("New currentValue: " # debug_show(currentValue));
  };

  public func withdraw(amount : Int){
    currentValue -= amount;
    Debug.print("New currentValue: " # debug_show(currentValue));
  };

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
}