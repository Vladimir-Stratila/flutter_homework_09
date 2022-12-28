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

![](C:/Users/Vladimir/Desktop/jobs_list_screen.png)
![](C:/Users/Vladimir/Desktop/job_details_screen.png)
![](C:/Users/Vladimir/Desktop/companies_list_screen.png)
![](C:/Users/Vladimir/Desktop/company_details_screen.png)