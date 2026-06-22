import React, { useState, useEffect } from 'react';
import './App.css';
import Navigation from './components/Navigation';
import HeroSection from './components/HeroSection';
import ProjectSection from './components/ProjectSection';
import StatisticsSection from './components/StatisticsSection';
import PartnersSection from './components/PartnersSection';
import FeaturesSection from './components/FeaturesSection';

function App() {
  const [currentPage, setCurrentPage] = useState('home');

  return (
    <div className="App">
      <Navigation currentPage={currentPage} setCurrentPage={setCurrentPage} />
      
      {currentPage === 'home' && (
        <>
          <HeroSection />
          <ProjectSection />
          <StatisticsSection />
          <PartnersSection />
          <FeaturesSection />
        </>
      )}
      
      {currentPage === 'quest' && (
        <div className="page-content">
          <div className="feature-page">
            <h1>Quest AI - Coming Soon</h1>
            <p>Our intelligent Volunteer Recommendation engine will help you find the best opportunities tailored to your interests and location.</p>
          </div>
        </div>
      )}
      
      {currentPage === 'maps' && (
        <div className="page-content">
          <div className="feature-page">
            <h1>Maps - Coming Soon</h1>
            <p>Find the nearest volunteer opportunities with our location-based discovery tool.</p>
          </div>
        </div>
      )}
      
      {currentPage === 'about' && (
        <div className="page-content">
          <div className="feature-page">
            <h1>About VolunteerHigh</h1>
            <p>VolunteerHigh is a platform dedicated to empowering high school students to discover meaningful volunteer opportunities in their communities.</p>
          </div>
        </div>
      )}
      
      {currentPage === 'faq' && (
        <div className="page-content">
          <div className="feature-page">
            <h1>Frequently Asked Questions</h1>
            <p>Have questions? We're here to help. Contact us for more information about VolunteerHigh.</p>
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
