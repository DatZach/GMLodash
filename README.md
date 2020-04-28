# GMLodash

This library is a port of the popular JavaScript library [Lodash](https://lodash.com/) to GML 2.3.  The intent is to be a utility library that enables a functional programming workflow. Not dissimillar to C#'s LINQ, or Python's List Comprehension.

## Getting Started
### Installation via Local Package (.yymps)

GameMaker Studio 2 allows you to import assets, including scripts and shaders, directly into your project via the "Local Package" system. From the [Releases](https://github.com/DatZach/GMLodash/releases) tab for this repo, download the .yymps file for the latest version. In the GMS2 IDE, load up your project and click on "Tools" on the main window toolbar. Select "Import Local Package" from the drop-down menu then import all scripts from the GMLodash package.

### Installation via Copy/Paste

You can simply copy and paste the contents of [GMlodash.gml](https://github.com/DatZach/Destructors/blob/master/scripts/GMLodash/GMLodash.gml) into a new Script in your project.

## Usage
Visit the [Documentation](https://github.com/DatZach/GMLodash/wiki) for full documentation on the API.
### Examples
```javascript
_.filter([1,2,3,4], function (x) { return x <= 2; }) => [1,2]   // array -> array

var list = ds_list_create();
ds_list_add(1,2,3,4);
_.filter(list, function (x) { return x <= 2; }) => list(1,2)    // list -> list
```
```javascript
var inventory = {
    items: [
        { itemId: "Sword", stock: 1 },
        { itemId: "Map", stock: 1 },
        { itemId: "Gem", stock: 4 }
    ]
};

// List of the the value of property "itemId" for each element
_.map(inventory.items, "itemId") => ["Sword","Map","Gem"]
```
```javascript
// Get the total stock of inventory
_.reduce(inventory, "stock", 0) => 6
```
```javascript
// Some elements's itemId property = "Map"
_.some(inventory, ["itemId","Map"]) => true
```
```javascript
// All items in the inventory have >= 1 stock (truthy evaluation)
_.every(inventory, "stock") => true
```

## Running the Unit  Tests

Clone this repo, open and run the project in GameMaker: Studio. If all Unit Tests pass, a message will be printed in the Output console and the game will close. Otherwise an error will be shown on screen.

## Authors

* **Zach Reedy** - *Primary developer* - [DatZach](https://github.com/DatZach)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
