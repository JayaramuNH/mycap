
const cds = require("@sap/cds");
const cov2ap = require("@cap-js-community/odata-v2-adapter");
cds.on("bootstrap", (app) => app.use(cov2ap()));
module.exports = cds.server;


// const myFirstService = function (srv) {
//     srv.on('hello', (req) => {
//         return 'Hello ' + req.data.to + "..!";
//     });

// }
// module.exports = myFirstService;