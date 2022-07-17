// Load .env variables
const axios = require("axios");
const text = require("./text");

setInterval(function () {
  axios
    .get("https://berus-lofi.run.goorm.io/info")
    .then((response) => {
	text.ChangeText(response.data.title + " - " + response.data.performerInfo);
      console.log(response.data.title + " - " + response.data.performerInfo);
      //console.log(response.data.performerInfo);
    })
    .catch((error) => {
      console.log(error);
    });
}, 5000);
const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Hello World')
})

app.listen(3000)
