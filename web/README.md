# VolunteerHigh Web App

A modern React web application that mirrors the SwiftUI design of the VolunteerHigh platform for high school students to discover meaningful volunteer opportunities.

## Features

- **Responsive Design**: Fully responsive layout that works on desktop, tablet, and mobile devices
- **Beautiful Animations**: Smooth transitions and scroll-triggered animations using Framer Motion
- **Partner Organizations**: Browse 8+ partner organizations with interactive cards
- **Statistics Dashboard**: Animated statistics showing the impact of volunteer work
- **Feature Sections**: Information about Quest AI and Maps features
- **Dark Theme**: Modern dark interface with elegant typography

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn

### Installation

1. Navigate to the web directory:
   ```bash
   cd web
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm start
   ```

4. Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

## Build

To create a production build:

```bash
npm run build
```

## Technologies Used

- **React 18**: UI library
- **Framer Motion**: Animation library
- **CSS3**: Styling with custom properties and gradients
- **Google Fonts**: Playfair Display and Cormorant Garamond fonts

## Project Structure

```
web/
├── public/
│   └── index.html
├── src/
│   ├── components/
│   │   ├── Navigation.js
│   │   ├── HeroSection.js
│   │   ├── ProjectSection.js
│   │   ├── StatisticsSection.js
│   │   ├── PartnersSection.js
│   │   ├── FeaturesSection.js
│   │   └── CountUpAnimation.js
│   ├── App.js
│   ├── index.js
│   └── index.css
├── package.json
└── README.md
```

## Color Palette

- **Primary Blue**: #4a90e2
- **Dark Background**: #000000
- **Light Background**: #fdfbf5
- **Accent Yellow**: #ffd700
- **Text Dark**: #152c5b
- **Text Light**: #ffffff

## Components

### Navigation
Sticky navigation bar with links to different sections and pages.

### HeroSection
Large hero banner with the main tagline and call-to-action.

### ProjectSection
Description of the VolunteerHigh platform and its mission.

### StatisticsSection
Animated counters showing key statistics about volunteering.

### PartnersSection
Grid display of partner organizations with hover effects.

### FeaturesSection
Showcase of Quest AI and Maps features with descriptions.

## Customization

To customize the partner organizations, edit the `partners` array in `PartnersSection.js`.

To modify colors, update the CSS files or the root CSS variables.

## License

This project is licensed under the SIL Open Font License 1.1 - see the LICENSE file in the repository for details.
