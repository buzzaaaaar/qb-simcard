# qb-simcard
A simple fivem resource for qbcore that will allow players to change their in-game phone number

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

And this to qb-core>shared>items.lua

`
['simcard'] 				 		 = {['name'] = 'simcard', 			    		['label'] = 'Sim Card', 					['weight'] = 1, 	['type'] = 'item', 		['image'] = 'simcard.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Its a new sim.. That means a new number?'},
`

Run run.sql file

## Configuration

Change line 4 in client script according to the number of characters you have in your server for a phone number

## Credits

Nerohiro for nh-keyboard

## Support

Contact me here for support: https://discord.gg/mEz9MPSXVK
