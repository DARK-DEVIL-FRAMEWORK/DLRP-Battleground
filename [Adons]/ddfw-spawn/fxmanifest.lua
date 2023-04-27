fx_version 'cerulean'
game 'gta5'

description 'ddfw-Spawn'
version '1.2.0'

shared_scripts {
    '@ddfw-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
    '@ddfw-apartments/config.lua',
}

client_script 'client.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/vue.js',
    'html/reset.css'
}

lua54 'yes'