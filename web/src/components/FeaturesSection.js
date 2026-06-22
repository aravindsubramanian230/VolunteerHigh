import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import './FeaturesSection.css';

const FeaturesSection = () => {
  const [isQuestVisible, setIsQuestVisible] = useState(false);
  const [isMapsVisible, setIsMapsVisible] = useState(false);
  const [questHovered, setQuestHovered] = useState(false);
  const [mapsHovered, setMapsHovered] = useState(false);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.target.id === 'quest-feature' && entry.isIntersecting) {
          setIsQuestVisible(true);
        }
        if (entry.target.id === 'maps-feature' && entry.isIntersecting) {
          setIsMapsVisible(true);
        }
      },
      { threshold: 0.3 }
    );

    const questElement = document.getElementById('quest-feature');
    const mapsElement = document.getElementById('maps-feature');
    if (questElement) observer.observe(questElement);
    if (mapsElement) observer.observe(mapsElement);

    return () => {
      if (questElement) observer.unobserve(questElement);
      if (mapsElement) observer.unobserve(mapsElement);
    };
  }, []);

  return (
    <>
      {/* Quest Feature */}
      <div id="quest-feature" className="feature-section quest-section">
        <motion.div
          className="feature-content"
          initial={{ opacity: 0, y: 40 }}
          animate={isQuestVisible ? { opacity: 1, y: 0 } : { opacity: 0, y: 40 }}
          transition={{ duration: 0.8 }}
        >
          <h2 className="feature-title">Quest - Our Volunteering Recommendation Engine</h2>
          <p className="feature-description">
            Quest is an intelligent Volunteer Recommendation engine that helps you to find the best volunteering opportunities tailored to your interests and location. Our AI-powered system analyzes your preferences and matches them with organizations that need your skills and passion.
          </p>
          <motion.button
            className="feature-button quest-button"
            onHoverStart={() => setQuestHovered(true)}
            onHoverEnd={() => setQuestHovered(false)}
            animate={{ backgroundColor: questHovered ? 'rgba(219, 231, 243, 0.2)' : 'transparent' }}
          >
            Use Quest
          </motion.button>
        </motion.div>
      </div>

      {/* Maps Feature */}
      <div id="maps-feature" className="feature-section maps-section">
        <motion.div
          className="feature-content"
          initial={{ opacity: 0, y: 40 }}
          animate={isMapsVisible ? { opacity: 1, y: 0 } : { opacity: 0, y: 40 }}
          transition={{ duration: 0.8 }}
        >
          <h2 className="feature-title maps-title">Maps</h2>
          <p className="feature-description maps-description">
            Want to find the nearest opportunity, and fast? Maps is our location-based volunteer discovery tool that helps you to find the nearest opportunity. By displaying volunteer opportunities on an interactive map, you can easily discover organizations near you and start making an impact in your community.
          </p>
          <motion.button
            className="feature-button maps-button"
            onHoverStart={() => setMapsHovered(true)}
            onHoverEnd={() => setMapsHovered(false)}
            animate={{ backgroundColor: mapsHovered ? 'rgba(255, 255, 255, 0.1)' : 'transparent' }}
          >
            Use Maps
          </motion.button>
        </motion.div>
      </div>
    </>
  );
};

export default FeaturesSection;
