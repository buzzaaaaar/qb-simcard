resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

client_script "client/client.lua"

name "QB Sim Card"
description "Change your in-game phone number using an item"
author "Buzzaaaaar"

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

shared_scripts {
    'config.lua'
}