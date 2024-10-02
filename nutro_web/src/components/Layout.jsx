import React from 'react';
import Footer from './Footer';
import NavBar from './NavbarComponent';
const Layout = ({ children }) => {
  return (
    <div>
        <NavBar/>
      <div className="flex">
        <main className="flex-1 h-screen overflow-y-auto">
          {children}
        </main>
      </div>
      <Footer />
    </div>
  );
};

export default Layout;
