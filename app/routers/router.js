const express = require('express');
const router = express.Router();
const attractionController = require('../controllers/attractionController');
const visitorController = require('../controllers/visitorController');
const routerWrapper = require('../handlers/routerWrapper');

router.get('/init/:id', routerWrapper(visitorController.ticketNumber))
router.get('/events', routerWrapper(attractionController.activeAttraction))
//         .get('/bookings',visitorController.futurBooking)

// router.put('/book',attractionController.requestReservation)

      


module.exports = router;