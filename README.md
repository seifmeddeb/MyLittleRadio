# Technical Test - My Little Radio

&#x20;This project is built with **SwiftUI** and **The Composable Architecture (TCA)**. We understand that TCA might not be familiar to all candidates, so we have provided a basic application skeleton to help you get started.

## Project Overview

The project consists of:

1. **SwiftUI Application**: The initial app displays a list of radio stations without any specific design. This list is managed by a **Reducer** and uses a mock data dependency provided via TCA's **dependencies** module.

2. **Mock Server**: We have included a simple Node.js server that exposes a list of radio stations. The server can be started to serve data from `http://localhost:3000/stations`.

The goal of this test is to assess your ability to enhance an existing SwiftUI application using TCA principles, improve the UI, and add meaningful features.

## JSON Data Format

The data from the Node.js server is structured in the following format:

```
{
  "stations": [
    {
      "id": "7",
      "brandId": "FIP",
      "title": "FIP",
      "hasTimeshift": false,
      "shortTitle": "Fip",
      "type": "on_air",
      "streamUrl": "https://icecast.radiofrance.fr/fip-midfi.mp3",
      "analytics": {
        "value": "fip",
        "stationAudienceId": 7
      },
      "liveRule": "apprf_fip_player",
      "colors": {
        "primary": "#e2007a"
      },
      "assets": {
        "squareImageUrl": "https://www.radiofrance.fr/s3/cruiser-production/2022/05/a174aea6-c3f3-4a48-a42c-ebc034f62c10/1000x1000_squareimage_fip_v2.jpg"
      },
      "isMusical": true
    },
    ...
  ]
}
```

## Requirements

We'd like you to enhance the project with the following features:

1. **Replace Mock Data with Server Call**

   - Replace the mock station data with a network call to the Node.js server at `http://localhost:3000/stations` to fetch the list of stations.

2. **Navigation to Station Details Page**

   - When a user clicks on a station in the list, they should be navigated to a details page for that station.
   - The detail page should be implemented in accordance with the existing architecture (using TCA's Reducer and View principles).

3. **Play Station Stream**

   - Add functionality to allow users to play the stream of a selected station.
   - This should be integrated in the details page and respect TCA's architecture.

4. **Improved User Interface**

   - Enhance the overall look and feel of the application using **SwiftUI**.
   - Feel free to use animations, custom components, or anything that can improve the user experience.

## Getting Started

1. **Fork the Repository**

   - Fork the project repository from the provided URL.

2. **Run the Mock Server**

   - Navigate to the `server` folder.
   - Run `npm install` to install the necessary dependencies.
   - Start the server with `node server.js`.

3. **Run the iOS Project**

   - Open the Xcode project.
   - Trust and enable the macros for the TCA and Dependencies libraries to ensure proper functionality.
   - The app should be able to run and display a list of mock stations generated locally.

## Submission Guidelines

- Fork the repository and make your changes.
- Please include a README file detailing the changes you've made, including any decisions or trade-offs you encountered you've made and any decisions or trade-offs you faced.

## Evaluation Criteria

- **Architecture**: How well you respect and extend the existing TCA architecture.
- **Code Quality**: Readability, organization, and use of best practices.
- **Functionality**: Successful implementation of the requested features.
- **User Interface**: Design quality and overall user experience.

Feel free to ask questions if anything is unclear. Good luck, and happy coding!
