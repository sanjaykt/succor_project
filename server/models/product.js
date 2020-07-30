const {DataTypes, Model} = require('sequelize');
const sequelize = require('../util/database');

class Product extends Model {
}

Product.init({
    // Model attributes are defined here
    productId: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    productName: {
        type: DataTypes.STRING,
        allowNull: false
        // allowNull defaults to true
    },
    productDetails: {
        type: DataTypes.STRING,
        allowNull: true
    },
    createdByUserId: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    modifiedByUserId: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    statusId: {
        type: DataTypes.INTEGER,
        allowNull: true
    }
}, {
    createdAt: 'createdDate',
    updatedAt: `modifiedDate`,
    timestamps: true,
    // Other model options go here
    sequelize, // We need to pass the connection instance
    modelName: 'Product' // We need to choose the model name
});

// the defined model is the class itself
console.log(Product === sequelize.models.Product); // true

module.exports = Product;
