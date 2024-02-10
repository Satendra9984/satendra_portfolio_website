Map projectsReadmeDummyData = {
'https://github.com/Satendra9984/veridox/blob/master/README.md': 
'''
# Veridocs Systems - FieldVerif 🌐

## Introduction 🚀

FieldVerif is a comprehensive solution designed to streamline and enhance the document verification process for organizations, particularly those engaged in third-party verification in industries such as Banking and Insurance. The application aims to revolutionize the verification process by automating document assignments, field visits, and related processes. With features like geo-tagging, analytics, and tracking, FieldVerif ensures efficient and effective management of customer documentation.

## FieldVerifier Mobile App Demo

https://github.com/Satendra9984/veridox/assets/81842437/7b877e6d-e67f-458c-aa40-aa7dd4af9feb

## Admin Panel

![VeridocsWebsiteAdmin]
(https://github.com/Satendra9984/veridox/assets/81842437/85e00788-8efe-409f-9c69-e22b80a22f73)




## High-Level Business Process / Requirements 📊

### Current Manual Process 🔄

1. **Document Initiation:**
   - Clients send documents/details for verification via email/secured application.
   - Agencies download documents/details and initiate verification through WhatsApp.

2. **Verification Reporting:**
   - Back-end staff takes verbal feedback from field verifiers.
   - Feedback is filled in the Bank’s reporting format and sent back to the client.

### Application Requirements 🔧

1. **App Activation:**
   - App activation through OTP after installation.
   - Admin activation from the Admin panel.

2. **Document Assignment:**
   - Office Coordinator assigns documents with unique case numbers, client names, and classification options.

3. **Case Assignment Tracking:**
   - Display assigned cases in the Field Verifier's app.
   - Sort cases in FIFO order.
   - View cases based on date and status (Assigned, In Progress, Submitted, Approved, Reject, Closed).

4. **Document Verification:**
   - Field verifier can enlarge and verify documents.
   - Capture geo-tagged photographs at two stages: landmark and customer's verification point.

5. **Reporting and Signature:**
   - Field verifier fills reporting format based on verification type.
   - Capture photographs with geo-tagging.
   - Field verifier adds a signature at the end of the verification process.

6. **Case Submission:**
   - Field verifier can save and review before submitting to the Office Coordinator.
   - Submission triggers status change to Submitted.

7. **Back-End Reporting:**
   - Office Coordinator downloads field verifier reports in Excel or Word format.

8. **Validation and Manual Reporting:**
   - Field verifier report validation.
   - Manual reporting by back-end team.

### Future Features 🚀
- **Application Form Scan:**
  - Scan application forms based on barcode.

## Features 🔍

### Location and Activity Tracking 📍

- **Location-Based Tracking:**
  - Real-time tracking of field representatives.
- **Activities Tracking:**
  - Monitor planned versus completed meetings per representative.

### Attendance and Customer Records 📅

- **Attendance, Leave, Working Hours:**
  - Daily attendance, leave, and working hours tracking.
- **Customers Records:**
  - Upload customer contacts and track visits and meetings.

### Task Assignment and Planning 📅

- **Assign Tasks:**
  - Create work plans and assign tasks.
- **Visit Planning:**
  - Allow representatives to plan weekly meetings with auto-approval.

### Document Presentation and Verification 📄

- **Document Presentation:**
  - Present product slides/catalogue/files with live tracking.
- **Verification Tracking:**
  - Track document open/presentation details.

### Reporting and Management 📈

- **Powerful Reports:**
  - Generate productivity and sales reports.
- **Announcements and Product Management:**
  - Create announcements and manage product details.

## Modules 🔗

1. **User (Sales/Medical Reps)**
2. **Company (Admin)**
3. **Doctor/Customer (TBD in Future)**

## User Roles/Groups 👥

1. **Representative (Sales/Medical)**
2. **Manager/Lead (Immediate manager/lead)**
3. **Admin, Area Lead, City Manager, etc.**

## Future/Upcoming Features 🚀

- **Order Automation, Payment & Collection Automation, Expense Management, Parties Management, Stock Taking, Activities Management, Beat Plan.**

## Why FieldVerif? 💼

- **Employee Location Tracking**
- **Field Sales Order Reporting**
- **Stock Level Management**
- **Streamlined Sales Activities**
- **Improved Team Collaboration**
- **Increased Company Revenue**

**Reduce sales gap and increase sales with FieldVerif!** 📊📈''',
  'https://github.com/Satendra9984/figma_to_digiaJson/blob/main/README.md':
      '''# 🚀 Figma To Digia JsonComponents Parser

## Overview

This project implements a sophisticated parser designed to convert Figma JSON representations into a streamlined JSON format compatible with Digia Components. Leveraging dynamic programming techniques and adhering to SOLID principles, the parser recursively processes each element in the Figma JSON, optimizing and extracting valuable data.

## Key Features 🔧

- **Dynamic Programming:** The parser employs dynamic programming techniques to efficiently process and optimize the complex structure of Figma JSON.
- **SOLID Principles:** The implementation adheres to SOLID principles, ensuring a modular and maintainable design that facilitates extensibility.
- **Recursive Parsing:** All elements within the Figma JSON are parsed recursively, extracting essential information and converting them into a linear and memoized structure compatible with Digia Components.

 ## Usage 📑

To use the parser, follow these steps:

1. [https://github.com/Satendra9984/figma_to_digiaJson](#) to your local machine.
2. Install the required dependencies.
3. Run the parser with your Figma JSON file as input.
4. Obtain the optimized Digia Components JSON output.

## Challenges and Fun 💡

Developing this parser presented a stimulating and challenging problem-solving experience. The combination of dynamic programming and adherence to SOLID principles ensures not only efficiency in processing but also a robust and maintainable codebase.

Feel free to explore the codebase, contribute, or use the parser in your projects. Happy coding!

📂 **Figma JSON File:** [figma.json](figma.json)

📂 **Digia JSON File:** [final_digia.json](final_digia.json)

## Project Images 🖼️
 ![text_ss](https://github.com/Satendra9984/figma_to_digiaJson/assets/81842437/27f826ce-7c34-428d-9afb-c86aa43472e4)![row_ss](https://github.com/Satendra9984/figma_to_digiaJson/assets/81842437/ec53d566-3550-4fce-a4f2-5f75c14201a3)![richtext_ss](https://github.com/Satendra9984/figma_to_digiaJson/assets/81842437/3e27868d-deb2-41ac-ba8e-5fe711df2f93)![column_ss](https://github.com/Satendra9984/figma_to_digiaJson/assets/81842437/f0be2972-314b-415d-a29a-47f0352bf7e5) 
''',



  'https://github.com/Satendra9984/fastapi_todo_backend/blob/main/README.md':
      '''
# Todo App Backend with FastAPI

Welcome to the README file for the Todo App Backend developed using FastAPI. This project provides a robust backend solution for managing todo tasks with CRUD operations and integrates JWT authentication for secure user access. PostgreSQL is utilized as the primary database, while SQLite3 is used for local database storage. SQLAlchemy is employed for efficient model mappings and ORM functionalities.

## Features

🚀 **FastAPI**: FastAPI is a modern, fast (high-performance) web framework for building APIs with Python 3.7+.

🔒 **JWT Authentication**: Implements JSON Web Token (JWT) authentication for secure user authentication and authorization.

🗃️ **PostgreSQL Database**: Utilizes PostgreSQL as the primary database to store todo tasks and user information.

📁 **SQLite3 Local Database**: Uses SQLite3 for local database storage, ensuring seamless development and testing.

🔄 **CRUD Operations**: Implements CRUD (Create, Read, Update, Delete) API endpoints for managing todo tasks.

🔍 **SQLAlchemy ORM**: Utilizes SQLAlchemy ORM for efficient and intuitive database interactions, including model mappings and database queries.
''',
  'https://github.com/Satendra9984/Kanak_Marketplace_App/blob/main/README.md': 
'''
# Kanak - Empowering Artisans and Delighting Buyers in the World of Precious Metals

## Introduction 🌟

Welcome to **Kanak**, a revolutionary marketplace designed for the seamless buying and selling of precious metals, such as Diamonds, Platinum, Gold, and Silver. At Kanak, we believe in simplifying the intricate world of precious metal transactions, offering a platform where both buyers and sellers can engage with confidence.

## Vision 🔭

Our vision at Kanak is to provide a hassle-free ecosystem where sellers can focus solely on their craft, and buyers can indulge in a refined experience, knowing they are getting top-notch quality, fair prices, and reliable delivery.

## Key Features 🚀

### Streamlined Buying Process 🌐

Enjoy a user-friendly interface designed with Flutter, ensuring a smooth and intuitive experience for buyers. Our platform employs cutting-edge technologies like Riverpod, Bloc Cubit, FlCharts, and shared_preferences to enhance user interaction and navigation.

### Robust Backend Infrastructure 💻

Powered by Amazon Web Services (AWS), Kanak utilizes Lambda functions, Amplify for app hosting, GraphQL for efficient queries, S3 for secure storage, and authentication services to provide a secure, reliable, and scalable backend.

### Secure Transactions with Razorpay 🔒

Kanak ensures secure and seamless transactions through integration with Razorpay, a leading payment gateway. Buyers can confidently make payments, knowing that their financial information is protected.

### Real-Time Market Data 📊

Stay informed with live pricing data through Metals Provider APIs, ensuring that buyers and sellers always have access to the latest market trends and rates.

## Artisan-Centric Approach 🎨

### Empowering Sellers 🛠️

Kanak aims to empower sellers by offering a platform where they can easily procure raw materials without worrying about inflated prices. With our platform, sellers can focus on honing their artistry and delivering exceptional products to customers.

### Quality Assurance ✔️

We understand the importance of quality in the world of precious metals. Kanak guarantees the quality of every transaction, assuring buyers that they are receiving authentic and superior products.

### Customer Satisfaction 🌟

Our commitment to customer satisfaction is unwavering. Kanak ensures that buyers receive not just a product, but an unforgettable experience - from competitive pricing to prompt delivery.

## Inspired Design 🎨

Our design philosophy, inspired by the elegance of [Goldia Gold Trading Mobile App on Behance](https://www.behance.net/gallery/139996351/Goldia-Gold-Trading-Mobile-App), reflects our dedication to providing a visually appealing and user-centric interface. The design ensures that every interaction with Kanak is a delightful experience.

## Conclusion 🌐

Though the project is deprecated, a demo video showcasing the platform's features will be available soon. At Kanak, we believe in the potential of innovation and strive to create a legacy where the world of precious metals is not just bought and sold but celebrated. Join us in this journey where technology meets artistry, and every transaction is a masterpiece.
''',
};
