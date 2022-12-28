# flutter_homework_09

Application that allows you to create and view companies and jobs from them

## List of used technologies

flutter_bloc -
A package that helps implement the BLoC pattern.

dio -
A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.

injector - 
A simple dependency injection lib for Dart.

equatable -
A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode.

## App architecture

The application architecture consists of the following layers:

User interface (UI) - displays information on the screen, receives commands from the user and sends them for processing to the next layer,

BLoCs - receives events from the IP, processes them, requesting data from the next layer and generates new states for display on the IP,

Repository - handles requests to retrieve data from a remote or local database

## Screenshots

![jobs_list_screen](https://user-images.githubusercontent.com/93329500/209801913-e25339d4-92f3-4491-a0cf-35bc16044e62.png)
![job_details_screen](https://user-images.githubusercontent.com/93329500/209801932-fa0e0ea9-339e-4627-82b3-f85279f6f150.png)
![companies_list_screen](https://user-images.githubusercontent.com/93329500/209801944-cef18b9d-e523-4cb5-8326-fe3569a9fc55.png)
![company_details_screen](https://user-images.githubusercontent.com/93329500/209801950-0cefcd2c-29b1-4167-b1ef-aeeeb07ba26e.png)
