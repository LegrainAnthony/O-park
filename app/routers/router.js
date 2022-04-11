const express = require('express');
const router = express.Router();

router.route('/incident/:id')
    .get(); 
    .post();

router.route('/incident/new')
    .get();
    .post();


router.get('/')
router.get('/init')
router.get('/events')
router.get('/bookings')

router.put('/book')
module.exports = router;