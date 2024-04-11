# Expense Tracker

A Flutter expense tracking project. It manages the expenses (Create,Read,Update,Delete) as well as 
shows latest expenses and gives option to see all expenses.

Along with this, it also shows total expense monthly and weekly with their segregation in different categories.

## Architecture

I used Clean Architecture as app architecture. I choose this architecture due to its core implementation of S.O.L.I.D principles and repository pattern.
Clean Architecture seperates client view (presentation layer) and business logic (data layer) with an intermidiary (domain layer) to communicate between them.
Domain layer exposes high-level functions and abstracts their low-level implementation from client.

## State Management

I used GetX as state management tool as it provides route management, dependency injection along with state management. While for other state management tools,
external packages are to be used for dependency injection and route management, getx provides it all. Along with this, due to its reactive nature, getx enables 
use of stateless widget using GetView which lets us update variables using controller in an instant.

## Testing

I used flutter_test package for unit testing as it provides a simple way to test out functions.

## Notifications

I used [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) package for setting up daily reminder. To enable notification even when app is killed, I used [flutter_background_service](https://pub.dev/packages/flutter_background_service) package to send periodic daily reminders.

## Running Project

1. Clone the project using link or download zip
2. After cloning, run flutter pub get

**Make sure to allow notification permission for app to get reminders**

