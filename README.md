# Cinema Ticket Booking Application

A Flutter-based mobile application for booking cinema tickets with complete user authentication, movie browsing, ticket purchasing, and transaction management.

## Features

### User Authentication
- User registration with validation
- Login system with email/username support
- Password security with minimum 6 characters
- Session management with SharedPreferences

### Movie Management
- Browse available movies with poster, genre, and pricing
- View multiple show schedules per movie
- Real-time movie information display

### Ticket Booking
- Select movie and preferred schedule
- Choose ticket quantity
- Multiple payment methods (Cash/Card)
- Card number validation for card payments
- Real-time total price calculation
- Date picker for purchase date

### Purchase History
- View all completed purchases
- Detailed purchase information
- Purchase status tracking

### Purchase Management
- View detailed purchase information
- Edit purchase details (quantity, payment method)
- Cancel purchases
- Masked card number display for security

### User Profile
- View personal information
- Display user details (name, email, phone, address)

## Technical Stack

- **Framework**: Flutter 3.9.2+
- **Database**: SQLite (sqflite)
- **State Management**: StatefulWidget
- **Local Storage**: SharedPreferences
- **Date Formatting**: intl package

## Color Scheme

- Primary Color: Maroon (#800000)
- Background: Light Beige (#FAF8F5)
- Design Style: Flat/Minimalist Material UI

## Database Schema

### Users Table
- id (INTEGER PRIMARY KEY)
- fullName (TEXT)
- email (TEXT UNIQUE)
- address (TEXT)
- phone (TEXT)
- username (TEXT UNIQUE)
- password (TEXT)

### Purchases Table
- id (INTEGER PRIMARY KEY)
- userId (INTEGER)
- movieTitle (TEXT)
- movieGenre (TEXT)
- moviePoster (TEXT)
- schedule (TEXT)
- buyerName (TEXT)
- quantity (INTEGER)
- purchaseDate (TEXT)
- totalPrice (REAL)
- paymentMethod (TEXT)
- cardNumber (TEXT)
- status (TEXT)

## Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

## Project Structure

```
lib/
├── data/
│   └── movie_data.dart
├── helpers/
│   └── database_helper.dart
├── models/
│   ├── movie.dart
│   ├── purchase.dart
│   └── user.dart
├── pages/
│   ├── edit_purchase_page.dart
│   ├── home_page.dart
│   ├── login_page.dart
│   ├── movie_list_page.dart
│   ├── profile_page.dart
│   ├── purchase_detail_page.dart
│   ├── purchase_form_page.dart
│   ├── purchase_history_page.dart
│   └── registration_page.dart
└── main.dart
```

## Navigation Flow

1. **Login/Registration** → User authentication
2. **Home** → Main menu with feature access
3. **Movie List** → Browse and select movies
4. **Purchase Form** → Complete ticket booking
5. **Purchase History** → View all purchases
6. **Purchase Detail** → View/Edit/Cancel specific purchase
7. **Profile** → View user information

## Validation Rules

- Email must end with @gmail.com
- Phone number must contain only digits
- Password minimum 6 characters
- Card number must be exactly 16 digits (when card payment selected)
- Quantity must be at least 1
- All required fields must be filled

## Security Features

- Password field with visibility toggle
- Card number masking in display
- User session management
- Input validation on all forms

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
