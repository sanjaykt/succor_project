const express = require('express');
const router = express.Router();
const response = require('./../response');
const Product = require('./../models/product');

router.get('/products', (req, res) => {
    Product.findAll().then((products) => {
        res.send('products list...');
    })
})

// //login
// product.post('/product/create', (req, res) => {
//     const product = req.body;
//     const foundProduct = Product.findOne({
//         where: {productname: product.productname}
//     }).then((foundProduct) => {
//         if (foundProduct.password === product.password) {
//             res.status(201).json({
//                 message: 'authenticated'
//             })
//         } else {
//             res.json({
//                 message: 'unauthenticated'
//             })
//
//         }
//     })
// })

// get products
router.get('/product/getAll', (req, res) => {
    Product.findAll().then((products) => {
        response.response({
            res: res,
            data: products,
            status: response.SUCCESS,
            message: 'successfully retrieved'
        })
    }).catch((error) => {
        response.response({
            res: res,
            data: null,
            status: response.FAILED,
            message: error.toString()
        })
    })
})

//create product
router.post('/product/create', (req, res) => {
    const product = req.body;
    Product.create({
        productName: product.productName,
        productDetails: product.productDetails,
        createdByUserId: 1,
        modifiedByUserId: 1,
        statusId: 1
    }).then((product) => {
        // console.log('product created successfully');
        response.response({
            res: res,
            data: product,
            status: response.SUCCESS,
            message: 'successful'
        });
    }).catch((error) => {
        response.response({
            res: res,
            data: null,
            status: response.FAILED,
            message: error.toString()
        })
    })
})

module.exports = router;
