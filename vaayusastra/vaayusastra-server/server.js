const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const cors = require('cors');
const { OAuth2Client } = require('google-auth-library');

const app = express();
app.use(bodyParser.json());
app.use(cors());

mongoose.connect('mongodb://localhost:27017/appusers', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

const UserSchema = new mongoose.Schema({
    username: String,
    password: String,
    email: String,
    name: String,
    dob: Date,
    phoneNumber: String // Add phone number field
});

const User = mongoose.model('User', UserSchema, 'details');

const CLIENT_ID = '905022693511-ekqnbsch7j2kja763s4nd0dj49926d0j.apps.googleusercontent.com';
const client = new OAuth2Client(CLIENT_ID);

// Login endpoint
app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    try {
        const user = await User.findOne({ email, password });
        if (user) {
            res.status(200).json({ message: 'Login successful' });
        } else {
            res.status(401).json({ message: 'Invalid email or password' });
        }
    } catch (error) {
        console.error('Error during login:', error);
        res.status(500).json({ message: 'An error occurred during login' });
    }
});

// Registration endpoint
app.post('/register', async (req, res) => {
    const { username, email, password, name, dob, phoneNumber } = req.body; // Add phoneNumber parameter
    try {
        // Check if the email is already registered
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ message: 'Email already registered' });
        }
        // Save new user to the database
        const newUser = new User({ username, email, password, name, dob, phoneNumber }); // Include phoneNumber field
        await newUser.save();
        // Respond with success message
        res.status(200).json({ message: 'Registration successful' });
    } catch (error) {
        console.error('Error registering user:', error);
        // Respond with error message
        res.status(500).json({ message: 'An error occurred while registering user' });
    }
});

// Google Login endpoint
app.post('/google-login', async (req, res) => {
    const { idToken } = req.body;
    try {
        const ticket = await client.verifyIdToken({
            idToken: idToken,
            audience: CLIENT_ID,  // Specify the CLIENT_ID of the app that accesses the backend
        });
        const payload = ticket.getPayload();
        const email = payload.email;
        
        // Check if user exists in your database
        let user = await User.findOne({ email });

        if (!user) {
            // Create a new user if doesn't exist
            user = new User({
                email,
                username: payload.name,
                name: payload.name,
                dob: new Date(),
                phoneNumber: '', // You can handle the phone number field accordingly
            });
            await user.save();
        }
        
        res.status(200).json({ message: 'Login successful' });
    } catch (error) {
        console.error('Error during Google login:', error);
        res.status(401).json({ message: 'Invalid Google token' });
    }
});

app.listen(3000, '0.0.0.0', () => {
    console.log('Server is running on port 3000');
});
