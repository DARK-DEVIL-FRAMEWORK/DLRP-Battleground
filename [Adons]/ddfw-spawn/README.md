# ddfw-spawn
Spawn Selector for ddfw-Core Framework :eagle:

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>


## Dependencies
- [ddfw-core](https://github.com/qbcore-framework/ddfw-core)
- [ddfw-houses](https://github.com/qbcore-framework/ddfw-houses) - Lets player select the house
- [ddfw-apartment](https://github.com/qbcore-framework/ddfw-apartment) - Lets player select the apartment
- [ddfw-garages](https://github.com/qbcore-framework/ddfw-garages) - For house garages

## Screenshots
![Spawn selector](https://i.imgur.com/nz0mPGe.png)

## Features
- Ability to select spawn after selecting the character

## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure ddfw-core
ensure ddfw-spawn
ensure ddfw-apartments
ensure ddfw-garages
```

## Configuration
An example to add spawn option
```
QB.Spawns = {
    ["spawn1"] = { -- Needs to be unique
        coords = vector4(1.1, -1.1, 1.1, 180.0), -- Coords player will be spawned
        location = "spawn1", -- Needs to be unique
        label = "Spawn 1 Name", -- This is the label which will show up in selection menu.
    },
    ["spawn2"] = { -- Needs to be unique
        coords = vector4(1.1, -1.1, 1.1, 180.0), -- Coords player will be spawned
        location = "spawn2", -- Needs to be unique
        label = "Spawn 2 Name", -- This is the label which will show up in selection menu.
    },
}
```
