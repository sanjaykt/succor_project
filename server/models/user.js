const {DataTypes, Model} = require('sequelize');
const sequelize = require('../util/database');


//
class User extends Model {
}

User.init({
    // Model attributes are defined here
    userId: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    username: {
        type: DataTypes.STRING,
        allowNull: false
        // allowNull defaults to true
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false
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
    modelName: 'User' // We need to choose the model name
});

// the defined model is the class itself
console.log(User === sequelize.models.User); // true

module.exports = User;
