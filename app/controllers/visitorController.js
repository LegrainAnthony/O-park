const datamapper = require('../models/datamapper');

const visitorController = {
    async ticketNumber(req,res){
        const id = req.params.id;
        const result = await datamapper.init(id);
        res.json(result);
    }
};

module.exports = visitorController;