# qb-simcard
A simple resource that will allow players to change their in-game phone number

## Dependencies

nh-keyboard - https://github.com/nerohiro/nh-keyboard

## Installation

Add the line below in to qb-core>server>player.lua (around line 260)

`
function self.Functions.UpdateNumber(newnumber)
  self.PlayerData.charinfo.phone = newnumber
  self.Functions.UpdatePlayerData()
end
`

And this to qb-core?shared>items.lua

`
['simcard'] 				 		 = {['name'] = 'simcard', 			    		['label'] = 'Sim Card', 					['weight'] = 1, 	['type'] = 'item', 		['image'] = 'simcard.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Its a new sim.. That means a new number?'},
`

Run run.sql file

## Credits

Nerohiro for nh-keyboard
