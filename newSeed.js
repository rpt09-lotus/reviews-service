const data = require('./quotes').quotes;
const fs = require('fs');

//THIS FILE GENERATES REVIEWS WHICH WERE THEN STORED IN schema.sql
const dateGen = () => {
  let dateStr = ''
  const years = [2018, 2017, 2016]

  let day = (Math.floor(Math.random() * (12 - 1) + 1));
  let month = (Math.floor(Math.random() * (30 - 1) + 1));
  let year = years[Math.floor(Math.random() * years.length)];

  return dateStr += day + '/' + month + '/' + year
}

const genBatch = () => {
  let trailId = 0;
  let dbData = '';

  for (var i = 0; i < 10000; i++) {
    trailId++;
    for (var j = 0; j < (Math.random() * (20 - 3) + 3); j++) {
      let date = dateGen();
      let rating = (Math.floor(Math.random() * (6 - 1) + 1));
      let userId = (Math.floor(Math.random() * (100 - 1) + 1));
      let review = data[Math.floor(Math.random() * data.length)];
      let actId = (Math.floor(Math.random() * (16 - 1) + 1));

      dbData += `${userId},${trailId},${rating},${review},${date},${actId}\n`;
    }
  }
  return dbData;
}

const appendToResults = fs.createWriteStream('results.csv', {
  flags: 'a'
});

appendToResults.write('user_id, trail_id, rating, description, date, act_id\n');

const seedDB = () => {
  for (let i = 0; i < 1000; i++) {
    appendToResults.write(genBatch());
  }
}

seedDB();
