import React, { useState } from 'react';
import './FAQPage.css';

const FAQPage = () => {
  const [openIndex, setOpenIndex] = useState(null);

  // Exact FAQs from your Swift code
  const faqs = [
    {
      question: "Is VolunteerHigh Free?",
      answer: "Yes! VolunteerHigh is a completely free tool that can be used by anybody in Arizona."
    },
    {
      question: "Do I have to sign up to use VolunteerHigh?",
      answer: "No. VolunteerHigh requires no sign ups, though some opportunities require an account or application."
    },
    {
      question: "What organizations is VolunteerHigh partnered with?",
      answer: "VolunteerHigh is partnered with 8 organizations across the valley as of now."
    },
    {
      question: "Can I use VolunteerHigh in California?",
      answer: "No. VolunteerHigh is currently a platform designed only for students in Arizona."
    },
    {
      question: "How can I contact VolunteerHigh?",
      answer: "Email VolunteerHighSupport@gmail.com"
    },
    {
      question: "Where can I contact the organizations?",
      answer: "You can contact our partner organizations directly through their websites or by visiting their locations listed on our Maps feature."
    }
  ];

  const toggleFAQ = (index) => {
    setOpenIndex(openIndex === index ? null : index);
  };

  return (
    <div className="page-wrapper faq-page">
      <div className="faq-container">
        <div className="faq-header">
          <div className="title-line"></div>
          <h1 className="faq-title">FAQ's</h1>
          <div className="title-line"></div>
        </div>
        
        <div className="faq-list">
          {faqs.map((faq, index) => (
            <div key={index} className="faq-item">
              <button
                className="faq-question"
                onClick={() => toggleFAQ(index)}
              >
                <span>{faq.question}</span>
                <span className={`toggle-icon ${openIndex === index ? 'open' : ''}`}>{openIndex === index ? '−' : '+'}</span>
              </button>
              {openIndex === index && (
                <div className="faq-answer">
                  {faq.answer}
                </div>
              )}
            </div>
          ))}
        </div>

        <section className="contact-section">
          <h2>Still have questions?</h2>
          <p>Contact us at <strong>VolunteerHighSupport@gmail.com</strong></p>
        </section>
      </div>
    </div>
  );
};

export default FAQPage;
