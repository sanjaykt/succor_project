const express = require('express');
const router = express.Router();
const User = require('./../models/user');
const response = require('./../response');

router.get('/users', (req, res) => {
    User.findAll().then((users) => {
        res.send('users list...');
    })
})

//login
router.post('/user/login', (req, res) => {
    const user = req.body;
    User.findOne({
        where: {username: user.username}
    }).then((foundUser) => {
        if (foundUser.password === user.password) {
            response.response({
                res: res,
                data: foundUser,
                status: response.SUCCESS,
                message: 'some message'
            });
        } else {
            res.json({
                message: 'unauthenticated'
            })

        }
    })
})

//create user
router.post('/user', (req, res) => {
    const user = req.body;
    User.create({
        username: user.username,
        password: user.password,
        createdByUserId: 1,
        modifiedByUserId: 1,
        statusId: 1
    }).then(() => {
        console.log('user created successfully');
    }).catch((error) => {
        console.log('Error Creating User: ' + error);
    })

    res.status(201).json({
        message: 'user created successfully...'
    })
})

module.exports = router;
