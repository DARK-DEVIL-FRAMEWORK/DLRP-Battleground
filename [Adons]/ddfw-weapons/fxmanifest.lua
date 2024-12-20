fx_version 'cerulean'
game 'gta5'

author 'DonHulieo'
description 'Weapons logic script, with attachment and weapon durabilty, weapon repairs and gun damage control.'
version '1.0.8'

shared_scripts {'@ddfw-core/shared/locale.lua', 'locales/en.lua', 'config.lua'}

server_script 'server/main.lua'


client_scripts {
    'client/main.lua',
    'client/AutoReload.lua'
}

files {'weaponsnspistol.meta'}

data_file 'WEAPONINFO_FILE_PATCH' 'weaponsnspistol.meta'

lua54 'yes'