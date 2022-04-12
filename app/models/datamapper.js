const client = require('./dbClient.js');

const datamapper = {
    // async newVisitor () {

    //     const query = {
    //         text : `INSERT INTO visitor 
    //                 (date_start_validity, date_end_validity)
    //                 VALUES
    //                 ($1, $2)`,
    //         values: [100000,1000500]
    //     }
    //     const result = await client.query(query)
    //     return result
    // }

    async init(id){
        const query = {
            text:`SELECT * FROM "visitor" WHERE "num_ticket" = $1`,
            values: [id]
        }
       let result = await client.query(query);
       return result.rows[0]
    },

    async events (time) {
        const query = {
            text : `SELECT * FROM attraction WHERE opening_time AND closing_time BETWEEN ${time}`
        }
    }
}

module.exports = datamapper;