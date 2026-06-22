import React, { useState } from 'react';
import './Navigation.css';

const Navigation = ({ currentPage, setCurrentPage }) => {
  const [activeNav, setActiveNav] = useState('home');

  const handleNavClick = (page) => {
    setCurrentPage(page);
    setActiveNav(page);
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  return (
    <nav className="navbar">
      <div className="nav-container">
        <div className="logo" onClick={() => handleNavClick('home')}>
          <span className="logo-text">VolunteerHigh</span>
        </div>
        
        <div className="nav-links">
          <button
            className={`nav-link ${activeNav === 'home' ? 'active' : ''}`}
            onClick={() => handleNavClick('home')}
          >
            Home
          </button>
          <button
            className={`nav-link ${activeNav === 'quest' ? 'active' : ''}`}
            onClick={() => handleNavClick('quest')}
          >
            Quest AI
          </button>
          <button
            className={`nav-link ${activeNav === 'maps' ? 'active' : ''}`}
            onClick={() => handleNavClick('maps')}
          >
            Maps
          </button>
          <button
            className={`nav-link ${activeNav === 'about' ? 'active' : ''}`}
            onClick={() => handleNavClick('about')}
          >
            About
          </button>
          <button
            className={`nav-link ${activeNav === 'faq' ? 'active' : ''}`}
            onClick={() => handleNavClick('faq')}
          >
            FAQ's
          </button>
        </div>
      </div>
    </nav>
  );
};

export default Navigation;
