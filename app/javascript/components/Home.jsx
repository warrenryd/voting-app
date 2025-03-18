import React from "react";

const Home = ({ message, user, band }) => {
  return (
    <div>
      <h1>{message}</h1>
      <p>Your email: {user && user.email_address ? user.email_address : "--"}</p>
      <p>Your favorite band: {band && band.name ? band.name : "--"}</p>
    </div>
  );
};

export default Home;
