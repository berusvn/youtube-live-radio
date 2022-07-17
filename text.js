const fs = require("fs");

module.exports.ChangeText = (text) => {
    try {
        fs.writeFileSync("livetext.txt", text);
    } catch { }
};
