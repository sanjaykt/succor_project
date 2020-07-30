// 'use strict';

// class Response {
//     constructor(res, data, status ,message) {
//         this.res = res;
//         this.data = data;
//         this.status = status;
//         this.message = message;
//     }
// }

const SUCCESS = 'Success';
const FAILED = 'Failed';

let response = function ({res: res, data: data, status: status, message: message}) {
    let serverResponse = {};
    serverResponse['status'] = status;
    serverResponse['message'] = message;
    if (data) {
        serverResponse['data'] = data;
    }
    res.setHeader('Content-Type', 'application/json');
    res.send(serverResponse);
    res.end();
}

module.exports = {response, SUCCESS, FAILED}
