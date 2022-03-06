import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {

var counter_value = 0;

//challenge 1
  public func add(m : Nat, n : Nat ) : async Nat {
    return (m + n);
};

//challenge 2
  public func square(n : Nat) : async Nat {
    return (n * n);
  };

//challenge 3

  public func days_to_second(n : Nat) : async Nat {
    return (n * 60 * 60 * 24);
  };

//challenge 4

  public func increment_counter(n : Nat) : async Nat {
    counter_value := counter_value + n;
    return counter_value;
  };

//challenge 5
public func divide(n : Nat, m : Nat) : async Bool {
  return (n % m) == 0;
};

//challenge 6
public func is_even(n : Nat) : async Bool {
  return (n % 2) == 0;
};

//challenge 7
public func sum_of_array(array : [Nat]) : async Nat {
  if (array.size() == 0){
    return 0
  } else {
    var result = 0;
    for (value in array.vals()){
      result := result + value;
    };
    return result;
  };
};

//challenge 8
public func maximum(array : [Nat]) : async Nat {
  var max = 0;
  for (value in array.vals ()){
    if (value > max){
      max := value;
    };
  };
  return max;
};

//challenge 9
public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
  return Array.filter(array, func (x: Nat) : Bool {
    return x != n
  });
};

//challenge 10
public func selection_sort(array : [Nat]) : async [Nat] {
  return Array.sort(array, Nat.compare);
  };
};