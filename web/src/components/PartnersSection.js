import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import './PartnersSection.css';

const PartnersSection = () => {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
        }
      },
      { threshold: 0.2 }
    );

    const element = document.getElementById('partners-section');
    if (element) observer.observe(element);

    return () => {
      if (element) observer.unobserve(element);
    };
  }, []);

  const partners = [
    { id: 1, name: 'HandsOn Greater Phoenix', logo: '🤝' },
    { id: 2, name: 'Arizona State Parks and Trails', logo: '🏞️' },
    { id: 3, name: 'City of Flagstaff', logo: '🏛️' },
    { id: 4, name: 'Junior Achievement of Arizona', logo: '📚' },
    { id: 5, name: 'Feed My Starving Children', logo: '🍽️' },
    { id: 6, name: 'Arizona Sustainability Alliance', logo: '🌱' },
    { id: 7, name: 'Bureau of Land Management', logo: '🌲' },
    { id: 8, name: 'Lost Our Homes Pet Rescue', logo: '🐾' }
  ];

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.1,
        delayChildren: 0.1
      }
    }
  };

  const itemVariants = {
    hidden: {
      opacity: 0,
      rotateY: -75,
      y: 20,
      scale: 0.92
    },
    visible: {
      opacity: 1,
      rotateY: 0,
      y: 0,
      scale: 1,
      transition: {
        duration: 0.6,
        ease: 'easeOut'
      }
    }
  };

  return (
    <div id="partners-section" className="partners-section">
      <div className="partners-container">
        <h2 className="partners-title">Our Partner Organizations</h2>
        
        <motion.div
          className="partners-grid"
          variants={containerVariants}
          initial="hidden"
          animate={isVisible ? 'visible' : 'hidden'}
        >
          {partners.map((partner, index) => (
            <motion.div
              key={partner.id}
              className="partner-card"
              variants={itemVariants}
              whileHover={{ scale: 1.05, y: -5 }}
            >
              <div className="partner-logo">{partner.logo}</div>
              <h3 className="partner-name">{partner.name}</h3>
            </motion.div>
          ))}
        </motion.div>
      </div>
    </div>
  );
};

export default PartnersSection;
