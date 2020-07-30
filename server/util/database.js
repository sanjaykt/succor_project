const {Sequelize} = require('sequelize');
// const models = require('./models');

const sequelize = new Sequelize('succor', 'root', 'ma00amma', {
    host: 'localhost',
    dialect: 'mysql'
});

try {
    sequelize.authenticate();
    console.log('Connection has been established successfully.');
} catch (error) {
    console.error('Unable to connect to the database:', error);
}

module.exports = sequelize;
