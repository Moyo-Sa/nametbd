**SYSTEM DESIGN OVERVIEW**
This 2D maze platformer game is inspired by Mario and ninja gaiden. The player navigates through a challenging maze, each containing collectible coins and various hazards/monsters. The primary goal is to collect all 4 scrolls (earth, fire, water and hunder) while also collecting the coins, defeating enemies, and environmental traps. Game encourages spatial awareness and decision-making rathan than random movement.

**Gameplay Mechanics**
**+ Movement:** The player can move left, right, and jump to navigate platforms and mazes
**+ Attack:** The player can attack the monsters via sword slash and lunge attacks
**+ Coin Collection:** The game has a set number of collectible coins
**+ Defense Collection:** The game has a collectable defense attack that prevents monster/hazard damage from affecting the player's health
**+ Lives System:** The player begins with healthbar at 200%. Each attack from a monster/hazard, decreases their health. When their health is at zero, they lose
**+ Win Condition:** Getting to the exit platform after collecting all scrolls
**+ Lose Condition:** Lives reach zero before collecting all the scrolls
**+ Checkpoint System:** After the player's demise, the game saves the player's coins, global position, monster defeat, and coins data.

**Collectibles and Hazard Design**

- Coins are distributed around the game
- Health are distributed around the game to reset player's health
- Monsters follow and attack the player if detected by them
- Chainsaw hazards create zones the player must carefully navigate around.

**Visual and Audio Feedback**

- Coins provide an audio upon collection
- Health rovide an audio upon collection
- Defense rovide an audio upon collection
- Taking damage (via monster or chainsaw) triggers an audio feedback effect
- Background music and sound effects enhance immersion and guide player responses.

**System Structure**

- The game uses a main loop to handle input, rendering, collision detection, and game state updates.
- Player data (health, score, coins, monsters defeated) persists until new game is hit or game completion
