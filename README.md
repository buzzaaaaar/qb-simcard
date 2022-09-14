# qb-simcard
A simple fivem resource for qbcore that will allow players to change their in-game phone number
## Changelogs

Fixed number sending as a integer to string

## Dependencies

qb-input - https://github.com/qbcore-framework/qb-input

## Installation

Add this to qb-core>server>player.lua (around line 260)

`
function self.Functions.UpdateNumber(newnumber)
        self.PlayerData.charinfo.phone = newnumber
        self.Functions.UpdatePlayerData()
    end
`

Add this to qb-core>shared>items.lua

`
['simcard'] 				 		 = {['name'] = 'simcard', 			    		['label'] = 'Sim Card', 					['weight'] = 1, 	['type'] = 'item', 		['image'] = 'simcard.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Its a new sim.. That means a new number?'},
`

Add simcard.png to qb-inventory>html>images

## Configuration

Check config.lua

## Support

Contact me here for support: https://discord.gg/mEz9MPSXVK
