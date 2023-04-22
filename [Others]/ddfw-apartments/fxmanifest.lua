fx_version 'cerulean'
game 'gta5'

description 'ddfw-Apartments'
version '2.2.0'

shared_scripts {
    'config.lua',
    '@ddfw-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
    'client/main.lua',
    'client/gui.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
}

dependencies {
    'ddfw-core',
    'ddfw-interior',
    'ddfw-clothing',
    'ddfw-weathersync'
}

lua54 'yes'
