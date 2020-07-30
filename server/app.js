const app = require('express')();
const port = 3030;
const bodyParser = require('body-parser');
const userRouter = require('./routes/users-route');
const productRouter = require('./routes/products-route');


const sequelize = require('./util/database')

sequelize.sync().then(() => {
    console.log('sequelize is syncing');
})

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}))

app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept"
    );
    res.setHeader(
        "Access-Control-Allow-Methods",
        "GET, POST, PATCH, PUT, DELETE, OPTIONS"
    );
    next(); //without this like, the execute with stop
});

app.get('/', (req, res, next) => {
    // user.findAll().then((user) => {
    res.send('Hello World!')
    // })
});

app.use(productRouter);
app.use(userRouter);



app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`));
