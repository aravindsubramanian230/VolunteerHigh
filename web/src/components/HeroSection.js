import React from 'react';
import { motion } from 'framer-motion';
import './HeroSection.css';

const HeroSection = () => {
  return (
    <div className="hero-section">
      <div className="hero-background">
        <div className="hero-overlay"></div>
        <div className="hero-gradient"></div>
      </div>
      
      <div className="hero-content">
        <motion.div
          className="hero-text"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
        >
          <h1 className="hero-title">
            <span className="main-text">Discover Meaningful</span>
            <span className="highlight-text">Student Service</span>
          </h1>
          
          <p className="hero-description">
            Together, we can make a lasting impact and build a better tomorrow for those in need
          </p>
        </motion.div>
      </div>
    </div>
  );
};

export default HeroSection;
