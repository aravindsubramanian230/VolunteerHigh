# VolunteerHigh

## Making Volunteer Opportunities Accessible to Every High School Student

VolunteerHigh is a volunteer opportunity platform designed for high school students in Arizona. 
This platform helps high school students find meaningful community service opportunities in their local communities.

Many students want to volunteer and make an impact in their communities but struggle to discover volunteer opportunities that match their eligibility and schedules.
VolunteerHigh addresses these challenges by bringing opportunities from nonprofits across Arizona into one accessible platforms.

Website: https://volunteerhigh.org/

Note: VolunteerHigh began as a native MacOS application developed with Swift and SwiftUI. 
To make the platform more accessible, the project was expanded into a web application using Claude Code during the development process.

## Features

-**Volunteer Opportunity Discovery:** Browse through different opportunities from various nonprofit organizations across the valley.
-**Opportunity Details:** Access essential information about an opportunity, such as its description, dates, age, and links to learn about these opportunities.
-**Updated Opportunity List:** Uses a Python Web scraper to keep our platform updated.
-**Cross-Platform:** Developed as a native macOS application using SwiftUI, with a web version built using Claude Code and React.

## How it Works
-**1) Opportunity Collection:**
A Python Web Scraper finds volunteer opportunities across supported organizations daily.
-**2) Data Processing:**
The colelcted information is then organized into JSON data containing opportunity details.
-**3) Opportunity Display:**
The application displays available opportunities, allowing students to browse organizations and discover opportunities.
-**4) Deployment:**
The web application is deployed using Firebase Hosting.


``mermaid

flowchart TD
  A["Partner Nonprofit Organizations"]
  B["Python Web Scraper"]
  C["Volunteer Opportunity Data"]
  D["VolunteerHigh MacOS Application"]
  E["SwiftUI interface"]
  F["High School Students"]

  A --> B
  B --> C
  C --> D
  D --> E
  E --> F
  

##Impact

VolunteerHigh is an initiative focused on improving community service access to high school students.

Current Milestones:
-8 Partnered Organizations across Arizona
-Featured by Scottsdale Progress (August 2026):[ https://www.scottsdale.org/neighbors/scottsdale-teen-builds-volunteer-path-for-peers/article_3eddebb0-a1e5-4737-9b39-3e2d3e608d8b.html](url)
-Featured by FOX 10 Phoenix (September 2026): [https://www.fox10phoenix.com/video/fmc-26na3obmes7ekihl
](url)

##Our Mission

Making community service easier to discover and accessible for high school students across Arizona.
