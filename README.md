# 📦 Lhannout - E-commerce Application

Welcome to **Lhannout**, an e-commerce application built with Ruby on Rails! 🚀

## 🌟 Features

- 👤 User registration
- 🔑 User login and logout
- 🔄 Change user role (buyer, seller, buyer-seller)
- 🛒 Browse and view products
- 📦 Sell products (seller profile)
- 🛍️ Buy products (buyer profile)
- 📃 View orders

## 🚀 Installation

### Prerequisites

- Ruby 2.7.2+
- Rails 6.0+
- SQLite3
- Node.js and Yarn

### Steps

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/repo-name.git
    cd repo-name
    ```

2. **Install dependencies:**

    ```bash
    bundle install
    yarn install
    ```

3. **Set up the database:**

    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4. **Start the server:**

    ```bash
    rails server
    ```

    Visit [http://localhost:3000](http://localhost:3000) in your browser. 🌐

## 📂 Project Structure

- **Controllers**: Handle the application logic and user input.
- **Models**: Manage the data, logic, and rules of the application.
- **Views**: Display the data provided by the controllers.

## 🔧 Usage

### User Roles

- **Buyer**: Can browse and buy products.
- **Seller**: Can list and sell products.
- **Buyer-Seller**: Can buy and sell products but cannot buy their own listed products.

### User Authentication

- **Registration**: Create an account to start using the platform.
- **Login**: Access your account.
- **Logout**: Securely end your session.

### Product Management

- **Create Products**: Sellers can list new products for sale.
- **Edit Products**: Update product details.
- **Delete Products**: Remove products from the listing.

### Order Management

- **Place Orders**: Buyers can place orders for products.
- **View Orders**: Check the status and details of your orders.

## 🧪 Running Tests

To run the tests, execute:

```bash
rails test
