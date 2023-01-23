var AWS = require("aws-sdk");

// Set the region
AWS.config.update({ region: "REGION" });

// Create SES service object
var ses = new AWS.SES({ apiVersion: "2010-12-01" });

var to = ["email@example.com"];
var from = "email@example.com";

// this must relate to a verified SES account
var params = {
  Destination: {
    ToAddresses: to,
  },
  Message: {
    Body: {
      Text: {
        Charset: "UTF-8",
        Data: "This is the message body in text format.",
      },
    },
    Subject: {
      Charset: "UTF-8",
      Data: "Test email",
    },
  },
  Source: from,
};

// send the email
ses.sendEmail(params, function (err, data) {
  if (err) console.log(err, err.stack); // an error occurred
  else console.log(data); // successful response
});
