const request = require('superagent');
const base_url = '/backlog_api/v2/';

export default class Api {
    get(url, params, cb) {
        return request
            .get(base_url + url)
            .query(params)
            .end(function (err, res) {
                if (err !== null) {
                    console.log(err);
                    return;
                }
                cb(res.body);
            });
    }

    post(url, params, cb) {
        return request
            .post(base_url + url)
            .send(params)
            .end(function (err, res) {
                if (err !== null) {
                    console.log(err);
                    return;
                }
                cb(res.body);
            });
    }
}