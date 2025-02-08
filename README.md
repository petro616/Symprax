# Symprax Project  

## Overview  
The **Symprax** project is a Flutter-based front-end application designed for e-commerce and delivery services, complemented by a PHP back-end and a shared database hosted on Namecheap. 
The project consists of three main applications:  

- **Symprax**: The user-facing e-commerce application.  
- **Delivery App**: The application for managing deliveries and orders.  
- **Admin App**: The administrative interface for order management and notifications and full controll for categories and products to add and edit.  

## Technologies Used  
- **Front-end**: Flutter, Dart  
- **Back-end**: PHP  
- **Database**: Shared hosting on Namecheap  
- **State Management**: GetX  
- **Notifications**: Firebase Cloud Messaging  

## Installation Instructions  
To install and run the apps locally, follow these steps:  

1. Clone the repository:  
   ```bash  
   git clone <git@github.com:petro616/Symprax.git>  
   ```  
2. Navigate to the project directory:  
   ```bash  
   cd symprax  
   ```  
3. Install dependencies:  
   ```bash  
   flutter pub get  
   ```  
4. Run the application:  
   ```bash  
   flutter run  
   ```  

## Usage  

### Symprax (User App)  
1. **Home Page**:  
   - Browse through categories and featured items, including top sellings and special offers.  
   - Use the navigation bar to switch between sections: Home, Favorites, Cart, Notifications, and Settings.  

2. **Favorites**:  
   - Users can save items to their favorites for easy access later.  

3. **Cart**:  
   - Add items to the cart for purchase. Users can review their selected items before checkout.  

4. **Notifications**:  
   - Real-time updates about offers and order status are managed via Firebase notifications.  

5. **Settings**:  
   - Set delivery addresses using Google Maps for location marking.  
   - Enter the title of the address, additional details, and phone number.
   - change language between arabic and english
   - contact with us
   - track your orders and see the archieve of your orders 

### Delivery App  
1. **Order Management**:  
   - Delivery personal can view assigned orders and manage their status (e.g., accept, complete).  
   - Users receive notifications for order updates.  

### Admin App  
1. **Order Approval**:  
   - Admins can review, approve, and manage pending orders.  
   - Use the archive feature to view and manage past orders.  

2. **Notifications**:  
   - Admins can send notifications to users and delivery personal to keep everyone informed.  
3. **Controll**
   - Full controller for adding and editing categories and products.

## Unique Features  
- **User Experience**: The design and user interface (UI) are crafted to provide a powerful and seamless experience for users.  
- **Multilingual Support**: The application supports both Arabic and English languages.  
- **Clean Code**: The code is well-structured and clean, ensuring maintainability and ease of understanding.  

## Future Improvements  
- **Tracking Feature**: Implement a tracking system for deliveries in future updates.  
- **Google Play Release**: Plan to release the app on Google Play for wider accessibility.

## Video Overview  
Check out our short video demonstration of the Symprax project:  
[Watch the Demo](<https://youtu.be/vU5pJ5CmHEA?si=hnH3EGcHFvzgRxnX>)

## Contributing  
Contributions are welcome! If you would like to contribute to the project, please follow these guidelines:  
- Fork the repository.  
- Create a new branch for your feature or bug fix.  
- Submit a pull request with a description of your changes.
