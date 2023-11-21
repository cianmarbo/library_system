const port = 3000;

const express = require("express");
const cors = require('cors');
const Sequelize = require("sequelize");

const path = require("path");

const app = express();
const sequelize = new Sequelize('postgres://cianmarbo@localhost:5432/library')

sequelize.authenticate()

.then(() => {
    console.log('Connection has been established successfully.');
})

.catch(err => {
    console.error('Unable to connect to the database:', err);
});

app.use(express.json());
app.use(cors());

app.listen(port, () => {
    console.log(`Example app listening on port ${port}!`);
});

const Books = sequelize.define(
    'Books', 
    {
        title: {
            type: Sequelize.STRING,
            allowNull: false
        },
        isbn: {
            type: Sequelize.STRING
        },
        author: {
            type: Sequelize.STRING
        },
        genre: {
            type: Sequelize.STRING
        },
        status: {
            type: Sequelize.INTEGER,
            allowNull: false
        }
    },
);

const Accounts = sequelize.define(
    'Accounts',
    {
        username: {
            type: Sequelize.STRING,

        },
        password: {
            type: Sequelize.STRING,
        }
    },
);

//return a specific book
app.get('/book/:bookId', async (req, res) => {
    const bookId = req.params.bookId

    try {
        const book = await Books.findAll({
            where: {
                id: bookId 
            }
        })

        res.json({ book })
    } catch(error) {
        console.error(error)
    }
})

//return all books
app.get('/books', async (req, res) => {
    try {
        const books = await Books.findAll()
        res.json(books)
    } catch (error) {
        console.error(error)
    }
})

//login request
app.post('/login', async (req, res) => {

    const { username, password } = req.body;

    try {
        const account = await Accounts.findOne({
            where: {
                username,
                password,
            },
        });

        if (account) {
            res.json({ message: 'LOGIN_SUCCESS' })
        } else {
            res.status(401).json({ message: 'Login unsuccessful' })
        }
    } catch (error) {
        console.error(error)
        res.status(500).json({ message: 'An error occurred' })
    }
});

//serve static html
app.use(express.static(path.join(__dirname, 'public')));