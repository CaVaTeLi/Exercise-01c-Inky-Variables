/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 
 Variable checking:
 
 Equality: "Spot" == "Spot"
 Not Equality: "Spot" != "Susan"
 Greater: >
 Less: <
 Great or equal: >=
 Less or equal: <=
 
*/

VAR Health = 5
VAR pet_name = ""
VAR torches = 0
VAR coins = 0
VAR Ruck_sack = 0

-> memory
== memory ==
 Before you stands the cavern of Sunderhill. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?
 *[Oliver] 
    ~ pet_name = "Oliver"  
    -> cave_mouth
 *[Susan]
    ~pet_name = "Susan"
    ->cave_mouth
 *[Spot]
    ~pet_name = "spot"
    ->cave_mouth 
 
== cave_mouth_reentry == 
The cave extends to the east and west. {not torch_pickup:There is a torch on the floor.}
+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
+ [Pick up torch] ->torch_pickup

== cave_mouth ==
You made it to the cave. If only {pet_name} could see you now! {not torch_pickup:There are torches on the floor.} The cave extends to the east and west.

You have {torches} torches

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up a torch] -> torch_pickup

=== torch_pickup ===
~ torches = torches + 1
You now have {torches} torches. May it light the way. -> cave_mouth_reentry


== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
+ {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth_reentry
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.{not rucksack_pickup: In the corner of the room you see a rucksack on the floor.}
+ [Pick up a handfull of coins]-> 20_coin_pickup 
* [Pick up rucksack]  -> rucksack_pickup
* {rucksack_pickup}[Stuff the bag with as many coins as you can] -> 200_coin_pickup
+ [Go Back] ->cave_mouth_reentry

==rucksack_pickup==
You put on the rucksack 
->east_tunnel_lit

== 200_coin_pickup ==
 ~ coins = coins + 200
 You now have {coins} coins!
 ->east_tunnel_lit
 
== 20_coin_pickup ==
 ~ coins = coins + 20
You now have {coins} coins! {not rucksack_pickup: You wish you had something to store your coins in.}
-> east_tunnel_lit

== west_tunnel ==
You are in the west. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> west_tunnel_lit 
+ [Go Back] -> cave_mouth_reentry
-> END

== west_tunnel_lit ==
 The light of your torch reveals two more tunnels. You can proceed to either the left or right.
 + [Go Left] -> left_tunnel
 + [Go Right] -> right_tunnel
 + [Go Back] -> cave_mouth_reentry
 ->END

 == left_tunnel ==
 As you walk further you notice green slime on the cave walls and a low grumbling sound. 
 + [Continue down the tunnel] 
 ->END
 + [Go Back] ->west_tunnel_lit
 ->END

 == right_tunnel ==
 As you proceed you see a door up ahead with a candle burning inside a lantern hanging above the door.
 + [Continue down the tunnel] -> In_front_of_door
 ->END
 +[Go Back] ->west_tunnel_lit
 ->END


 == In_front_of_door == 
  You don't hear any noise coming from the other side of the door. You are unsure what to do.
 + [Knock on the door.] -> Someone_answers
 ->END
 + [Open the door.]
 ->END
 + [Go Back] ->right_tunnel 
 -> END
 
  ==Someone_answers==
 You hear heavy footsteps approaching the door...the door swings wide open, a man glares at you in anger ... "What are you doing here!? It's not safe. You need to leave."
 + [Who are you?] ->END
 + [Why isn't it safe?] ->The_man_replies1 
 ->END 
 
 ==The_man_replies1 ==
 This cave is no place for someone like you.
 * [Some one like me!? What is that supposed to mean!?] ->Reply_2
 
 ==Reply_2==
 Someone who is unarmed, don't you know anything!?
 *Apparently not! ->END
 *I literally have never been here before how should I know!? ->END
 
 
 
 
 
 
 