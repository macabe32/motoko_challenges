import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Nat "mo:base/Int";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Nat32 "mo:base/Nat32";
import Int "mo:base/Nat";
import Prim "mo:prim";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Bool "mo:base/Bool";
import Result "mo:base/Result";

actor {
// Challenge 1 : Write a private function swap that takes 3 parameters : a mutable array , an index j and an index i and returns the same array but where value at index i and index j have been swapped.

    //  private func swap(array : [var Nat], j : Nat, i : Nat) : [var Nat]{
    //      let a : [var Nat] = [var 1, 3];
    //      a[1] := j;
    //      a[3] := i;
    //     return a;
    //  };
 private func swap(array : [Nat], i : Nat, j : Nat) : [Nat] {
      let mutable_array = Array.thaw<Nat>(array); 
      mutable_array[i] :=  array[j];
      mutable_array[j] :=  array[i];
      return(Array.freeze<Nat>(mutable_array));
  };

 // Challenge 2 : Write a function init_count that takes a Nat n and returns an array [Nat] where value is equal to it's corresponding index.

 // Note : init_count(5) -> [0,1,2,3,4].
 // Note 2 : Do not use Array.append.
    // public func init_count(n : Nat) : async [Nat]{
    //  var a : Nat = 0;
    //  for (i in Iter.range(0,n-1)){
    //      a := Buffer.add(i);
    //      b := Buffer.append(a);
    //  };
    //  return Buffer.toArray(a);
    // };

   public func init_count(n : Nat) : async [Nat] {
      let mut = Array.init<Nat>(n, 0);
      var counter = 0;
      for(value in mut.vals()){
        array[i] := counter;
        counter += 1;
      };
      return(Array.freeze<Nat>(mut));
    };

 // Challenge 3 : Write a function seven that takes an array [Nat] and returns "Seven is found" if one digit of ANY number is 7. Otherwise this function will return "Seven not found".

    public func seven(a : [Nat]) : async Text {
        // var b : [Text] = [];
        for (val in a.vals()){
            var tmp: Text = Nat.toText(val);
            if(Text.contains(tmp, #text "7" )){
                return "Seven is found";
            };
        };
    return "Seven not found";
    }; 



 // Challenge 4 : Write a function nat_opt_to_nat that takes two parameters : n of type ?Nat and m of type Nat . This function will return the value of n if n is not null and if n is null it will default to the value of m.
    public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
           switch(n){
            case(null) {
                return (m);
            };
            case(?n){
                return n;
            };
        };
    };


 // Challenge 5 : Write a function day_of_the_week that takes a Nat n and returns a Text value corresponding to the day. If n doesn't correspond to any day it will return null .

 // day_of_the_week (1) -> "Monday".
 // day_of_the_week (7) -> "Sunday".
 // day_of_the_week (12) -> null.

  public func day_of_the_week(n : Nat) : async ?Text {

    switch(n){
        case(1){
        return "Monday";   
        };
        case(2){
        return "Tuesday";   
        };
        case(3){
        return "Wednesday";   
        };
        case(4){
        return "Thursday";   
        };
        case(5){
        return "Friday";   
        };
        case(6){
        return "Saturday";   
        };
        case(7){
        return "Sunday";   
        };
        case(_){
            return null;
        };

    };
  }; 

 // Challenge 6 : Write a function populate_array that takes an array [?Nat] and returns an array [Nat] where all null values have been replaced by 0.
 // Note : Do not use a loop.
    //  public func populate_array(a : [?Nat]) : async [Nat] {
    //   return Array.map([a], checkval);
    //  };

    //  public func chackval(val : ?Nat): async Nat {
    //      switch(val){
    //          case (null){
    //          return  0;
    //      };
    //      case(?something){
    //          return something;
    //      };
    //  };
  //  Challenge 6
  public func populate_array(array : [?Nat]) : async [Nat] {
    Array.map<?Nat,Nat>(array, func(x) {
      switch(x){
        case(null) return 0;
        case(?x) return x;
      };
    });
  };
 // Challenge 7 : Write a function sum_of_array that takes an array [Nat] and returns the sum of a values in the array.
 // Note : Do not use a loop.
  public func sum_of_array(array : [Nat]) : async Nat {
    let sum = Array.foldLeft<Nat, Nat>(array, 0, func(a , b) {a + b});
    return(sum);
  };
 // Challenge 8 : Write a function squared_array that takes an array [Nat] and returns a new array where each value has been squared.
 // Note : Do not use a loop.
 public func squared_array(array : [Nat]) : async [Nat] {
    return(Array.map<Nat,Nat>(array, func(x) { x*x }));
  };
 // Challenge 9 : Write a function increase_by_index that takes an array [Nat] and returns a new array where each number has been increased by it's corresponding index.
 // Note : increase_by_index [1, 4, 8, 0] -> [1 + 0, 4 + 1 , 8 + 2 , 0 + 3] = [1,5,10,3]
 // Note 2 : Do not use a loop.

 public func increase_by_index(array : [Nat]) : [Nat] {
    return(Array.mapEntries<Nat,Nat>(array, func(a, index) {a + index}));
  };

 // Challenge 10 : Write a higher order function contains<A> that takes 3 parameters : an array [A] , a of type A and a function f that takes a tuple of type (A,A) and returns a boolean.
 // This function should return a boolean indicating whether or not a is present in the array.
 


};

