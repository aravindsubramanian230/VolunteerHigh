import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import './ProjectSection.css';

const ProjectSection = () => {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
        }
      },
      { threshold: 0.3 }
    );

    const element = document.getElementById('project-section');
    if (element) observer.observe(element);

    return () => {
      if (element) observer.unobserve(element);
    };
  }, []);

  return (
    <div id="project-section" className="project-section">
      <motion.div
        className="project-content"
        initial={{ opacity: 0, y: 40 }}
        animate={isVisible ? { opacity: 1, y: 0 } : { opacity: 0, y: 40 }}
        transition={{ duration: 0.8 }}
      >
        <h2 className="section-title">The VolunteerHigh Project</h2>
        
        <p className="section-description">
          A platform that empowers students to find, explore, and engage in
        </p>
        
        <p className="section-description">
          meaningful local volunteer opportunities while creating lasting community impact.
        </p>
      </motion.div>
    </div>
  );
};

export default ProjectSection;
