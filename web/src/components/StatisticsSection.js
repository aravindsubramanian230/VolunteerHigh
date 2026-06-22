import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import CountUpAnimation from './CountUpAnimation';
import './StatisticsSection.css';

const StatisticsSection = () => {
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

    const element = document.getElementById('stats-section');
    if (element) observer.observe(element);

    return () => {
      if (element) observer.unobserve(element);
    };
  }, []);

  const stats = [
    {
      number: 90,
      suffix: '%+',
      description: 'of students participated in volunteer work before entering college'
    },
    {
      number: 100,
      suffix: '+',
      description: 'volunteering hours by the average high schooler before graduating.'
    },
    {
      number: 92,
      suffix: '%+',
      description: 'of admissions officers value 4-year volunteering'
    }
  ];

  return (
    <div id="stats-section" className="statistics-section">
      <div className="stats-container">
        {stats.map((stat, index) => (
          <motion.div
            key={index}
            className="stat-card"
            initial={{ opacity: 0, y: 20 }}
            animate={isVisible ? { opacity: 1, y: 0 } : { opacity: 0, y: 20 }}
            transition={{ duration: 0.6, delay: index * 0.1 }}
          >
            <div className="stat-line"></div>
            {isVisible && (
              <div className="stat-number">
                <CountUpAnimation targetNumber={stat.number} />
                <span>{stat.suffix}</span>
              </div>
            )}
            <p className="stat-description">{stat.description}</p>
          </motion.div>
        ))}
      </div>
    </div>
  );
};

export default StatisticsSection;
