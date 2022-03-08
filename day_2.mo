import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Nat "mo:base/Int";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Nat32 "mo:base/Nat32";
import Int "mo:base/Nat";
import Prim "mo:prim";
import Array "mo:base/Array";

//Challenge 1 : Write a function nat_to_nat8 that converts a Nat n to a Nat8. Make sure that your function never trap.
actor {
  public func nat_to_nat8(n : Nat) : async Nat8 {
    let nat8 = Nat8.fromNat(n);
    return nat8;
  };

 //Challenge 2 : Write a function max_number_with_n_bits that takes a Nat n and returns the maximum number than can be represented with only n-bits.
 public func max_number_with_n_bits(n : Nat) : async Nat {
   return((2 ** n) -1);
 };

 // Challenge 3 : Write a function decimal_to_bits that takes a Nat n and returns a Text corresponding to the binary representation of this number.
 public func decimal_to_bits(n : Nat) : async Text {
   if (n == 0) {
     return "pick a different number"
   };
   var tmp : Nat = n;
   var binary : Nat = 0;
   var counter : Nat = 0;
   while ( tmp > 0) {
     binary := ((tmp % 2)*(10**counter)) + binary;
     tmp := (tmp/2);
     counter += 1;
   };
   var output = Nat.toText(binary);
   return output
 };

 //Challenge 4 : Write a function capitalize_character that takes a Char c and returns the capitalized version of it.
 public func capitalize_character(c : Char) : async Text {
   //var c = 'a';
   var tmp : Nat32 = Char.toNat32(c);
   tmp -= 32;
   var output: Char = Char.fromNat32(tmp);
   return Char.toText(output);
 };

 //Challenge 5 : Write a function capitalize_text that takes a Text t and returns the capitalized version of it.
 public func capitalize_text(t : Text) : async Text {
    return Text.map(t, Prim.charToUpper);
 };


 //Challenge 6 : Write a function is_inside that takes two arguments : a Text t and a Char c and returns a Bool indicating if c is inside t . 
 public func is_inside(t : Text, c : Text) : async Bool {
   var counter = 0;
   for (char in t.chars()){
     for (char2 in c.chars()){
      if (char == char2) {
       counter +=1;
     };
    }; 
   };
   return counter >= 1;
 };

 //Challenge 7 : Write a function trim_whitespace that takes a text t and returns the trimmed version of t. Note : Trim means removing any leading and trailing spaces from the text
 //  public func trim_whitespace (t : Text) : async Text {
 //    take t and use Pattern to recognize (#char : Char(" "))
 //      trim(result) = output
 //        return output

 //Challenge 8 : Write a function duplicated_character that takes a Text t and returns the first duplicated character in t converted to Text. Note : The function should return the whole Text if there is no duplicate character 
 //  public func duplicated_character (t : Text) : async Text {
 //    if Pattern (#predicate : Char) false
 //      return t
 //        else
 //  take t and use Pattern to recognize (#text : Text)
 //      return p (charecter that is repeated)




 //Challenge 9 : Write a function size_in_bytes that takes Text t and returns the number of bytes this text takes when encoded as UTF-8.
  public func size_in_bytes(t : Text) : async Nat {
      return Text.encodeUtf8(t).size();
  };
 //Challenge 10

 //  public func bubble_sort(nums : [Nat]) : async [Nat] {
 //     var new_nums : [var Nat] = Array.thaw(nums);
 //     var last_idx : Nat = new_nums.size() - 1;
 //     for (i in Iter.range(0,last_idx)) {
 //       for (j in Iter.range(0,last_idx - i - 1)) {
 //         if (new_nums[j] > new_nums[j+1]) {
 //           var tmp = new_nums[j];
 //           new_nums[j] := new_nums[j+1];
 //           new_nums[j+1] := tmp;
 //         };
 //       };
 //     };
 //     return Array.freeze(new_nums);
 //   };
 // INCORRECT ERROR BELOW RETURNS
 //  Stderr:
 // /Users/macabe/Desktop/CODE/challenges/day_2.mo:90.2-90.8: syntax error [M0001], unexpected token 'public', expected one of token or <phrase> sequence:
 //   }
 //   seplist(<dec>,<semicolon>)

 // };

 };
