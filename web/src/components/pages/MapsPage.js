import React, { useState, useEffect } from 'react';
import './MapsPage.css';

const MapsPage = () => {
  const [selectedLocation, setSelectedLocation] = useState(null);
  const [address, setAddress] = useState('');
  const [mapKey] = useState(process.env.REACT_APP_GOOGLE_MAPS_API_KEY || 'YOUR_GOOGLE_MAPS_API_KEY');

  // All 21 volunteer locations from your Swift code
  const locations = [
    { id: 1, name: 'TopGolf Competition - Gilbert', lat: 33.320189, lng: -111.74155, org: 'HandsOn Greater Phoenix' },
    { id: 2, name: 'Grief Peer Support Group Facilitators for Kids & Caregivers', lat: 33.679308, lng: -112.225847, org: 'Arizona State Parks' },
    { id: 3, name: 'Heart of Isaac Community Center - Food Distribution', lat: 33.464236, lng: -112.126860, org: 'Feed My Starving Children' },
    { id: 4, name: 'From the Ground Up: Volunteer Day at the Ranch', lat: 33.372848, lng: -112.036277, org: 'Arizona Sustainability' },
    { id: 5, name: 'August 2026 Monthly Park Cleanup and Stinknet Removal - Kiwanis Park', lat: 33.366737, lng: -111.935198, org: 'City of Flagstaff' },
    { id: 6, name: "Chef's Night Off at HomeBase", lat: 33.497095, lng: -112.061546, org: 'HandsOn Greater Phoenix' },
    { id: 7, name: 'August 2026 #TrashTag Cleanup and Stinknet Removal - Tempe Town Lake', lat: 33.432562, lng: -111.921013, org: 'Arizona State Parks' },
    { id: 8, name: "Thrift Shop Assistants at Hope's Closet", lat: 33.451498, lng: -112.356531, org: 'City of Flagstaff' },
    { id: 9, name: 'Administrative Tasks - Tempe Office', lat: 33.393317, lng: -111.948852, org: 'HandsOn Greater Phoenix' },
    { id: 10, name: 'Lost Our Homes Pet Rescue', lat: 33.403296, lng: -111.951717, org: 'Lost Our Homes Pet Rescue' },
    { id: 11, name: 'Full Moon Bike Ride/Hike!', lat: 35.206000, lng: -111.655000, org: 'Arizona State Parks' },
    { id: 12, name: 'Garden Maintenance Volunteer Day - Bonito', lat: 35.204000, lng: -111.653150, org: 'Arizona State Parks' },
    { id: 13, name: 'Garden Maintenance Volunteer Day - Southside', lat: 35.188051, lng: -111.646597, org: 'Arizona State Parks' },
    { id: 14, name: 'Invasive Weed Identification, Removal & Reseeding', lat: 35.227632, lng: -111.557224, org: 'Arizona State Parks' },
    { id: 15, name: 'Full Moon Hike - Mars Hill Trail', lat: 35.209960, lng: -111.680370, org: 'Arizona State Parks' },
    { id: 16, name: 'Jerome State Historic Park', lat: 34.753647, lng: -112.111248, org: 'Arizona State Parks' },
    { id: 17, name: 'Picacho Peak State Park', lat: 32.646409, lng: -111.394838, org: 'Arizona State Parks' },
    { id: 18, name: "Rockin' River Ranch State Park", lat: 34.503340, lng: -111.830419, org: 'Arizona State Parks' },
    { id: 19, name: 'Catalina State Park', lat: 32.418141, lng: -110.935255, org: 'Arizona State Parks' },
    { id: 20, name: 'Red Rock State Park', lat: 34.839628, lng: -111.780522, org: 'Arizona State Parks' },
    { id: 21, name: 'Volunteer Opportunity', lat: 33.363980, lng: -111.954203, org: 'General' }
  ];

  const mapEmbedUrl = `https://www.google.com/maps/embed?pb=!1m12!1m8!1m3!1d106697!2d-111.9!3d33.4!3m2!1i1024!2i768!4f13.1!2m1!1sphoenix%20arizona!5e0!3m2!1sen!2sus!4v1719106234567`;

  return (
    <div className="page-wrapper maps-page">
      <div className="maps-container">
        <h1 className="maps-title">Find Nearby Volunteer Opportunities</h1>
        
        <div className="maps-content">
          <div className="map-wrapper">
            <iframe
              src={mapEmbedUrl}
              width="100%"
              height="500"
              style={{ border: 0, borderRadius: '12px' }}
              allowFullScreen=""
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
            ></iframe>
          </div>

          <div className="locations-panel">
            <div className="search-box">
              <input
                type="text"
                placeholder="Enter your address"
                value={address}
                onChange={(e) => setAddress(e.target.value)}
                className="location-search"
              />
              <button className="search-btn">Find Nearest</button>
            </div>

            <h3>Volunteer Opportunities ({locations.length})</h3>
            <div className="locations-list">
              {locations.map((location) => (
                <div
                  key={location.id}
                  className={`location-item ${selectedLocation?.id === location.id ? 'active' : ''}`}
                  onClick={() => setSelectedLocation(location)}
                >
                  <h4>{location.name}</h4>
                  <p className="org-label">{location.org}</p>
                  <p className="coords">📍 {location.lat.toFixed(3)}, {location.lng.toFixed(3)}</p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default MapsPage;
