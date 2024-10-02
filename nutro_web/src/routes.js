import React from 'react';
import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';
import Layout from './components/Layout';
import Home from './screens/Home/Home';
import Contact from './screens/Contact/Contact';
import ProductsPage from './screens/ProductsPage/ProductsPage';

const AppRoutes = () => {
 

  return (
    <Router>
      <Layout>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/contact" element={<Contact />} />
          <Route path="products-page" element={<ProductsPage/>}/>
          <Route path="*" element={<Navigate to="/" replace={true} />} />
        </Routes>
      </Layout>
    </Router>
  );
};

export default AppRoutes;
