import React from 'react';
import { Link } from 'react-router-dom'; // Import Link from react-router-dom
import { FaFacebookF, FaTwitter, FaInstagram, FaLinkedinIn } from 'react-icons/fa'; // Import React Icons

const Footer = () => {
  return (
    <footer className="bg-[#F5F5F7] text-black py-8">
      <div className="container mx-auto px-4">
        <div className="flex flex-col md:flex-row justify-between">
          <div>
            <h2 className="text-xl font-bold">BERRY DAYS</h2>
            <p className="mt-2">Leading provider of quality.</p>
          </div>
          <div className="mt-4 md:mt-0">
            <h3 className="text-lg font-semibold">Quick Links</h3>
            <ul className="mt-2 space-y-1">
              <li><Link to="/" className="hover:underline">Home</Link></li>
              <li><Link to="/products-page" className="hover:underline">Products</Link></li>
              <li><Link to="/contact" className="hover:underline">Contact</Link></li>
            </ul>
          </div>
          <div className="mt-4 md:mt-0">
            <h3 className="text-lg font-semibold">Follow Us</h3>
            <div className="flex space-x-4 mt-2">
              <a href="#" className="flex items-center justify-center w-10 h-10 rounded-full bg-transparent hover:bg-gray-300 transition duration-300 ease-in-out">
                <FaFacebookF className="w-5 h-5" />
              </a>
              <a href="#" className="flex items-center justify-center w-10 h-10 rounded-full bg-transparent hover:bg-gray-300 transition duration-300 ease-in-out">
                <FaTwitter className="w-5 h-5" />
              </a>
              <a href="#" className="flex items-center justify-center w-10 h-10 rounded-full bg-transparent hover:bg-gray-300 transition duration-300 ease-in-out">
                <FaInstagram className="w-5 h-5" />
              </a>
              <a href="#" className="flex items-center justify-center w-10 h-10 rounded-full bg-transparent hover:bg-gray-300 transition duration-300 ease-in-out">
                <FaLinkedinIn className="w-5 h-5" />
              </a>
            </div>
          </div>
        </div>
        <div className="mt-8 text-center border-t border-gray-600 pt-4">
          <p>&copy; {new Date().getFullYear()} Berry Days. All rights reserved.</p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
