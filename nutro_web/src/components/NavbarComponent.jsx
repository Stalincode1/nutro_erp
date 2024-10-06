import { Link, useLocation } from 'react-router-dom';
import { FaBars, FaShoppingCart, FaUser, FaSearch } from 'react-icons/fa';
import { useState } from 'react';

const NavBar = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const location = useLocation(); // Get the current location

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  return (
    <header className="bg-white shadow-lg">
      <div className="container mx-auto flex items-center justify-between h-20 py-4 px-4 lg:px-6 xl:px-8">
        {/* Logo Section */}
        <div className="flex-shrink-0">
          <Link to="/">
            <img
              src="https://i.ibb.co/W6ZXdqN/2021-10-26-16h20-21.png"
              alt="Logo"
              className="h-10"
            />
          </Link>
        </div>

        {/* Hamburger Icon (Mobile) */}
        <div className="md:hidden flex items-center">
          <button onClick={toggleMenu}>
            <FaBars size={24} className="text-gray-700" />
          </button>
        </div>

        {/* Search Bar and Icon Side by Side (Hidden on small screens) */}
        <div className="hidden md:flex flex-grow mx-4 items-center">
          <div className="relative w-full">
            <input
              type="text"
              placeholder="Search products"
              className="block w-full py-2 px-4 pr-12 border border-gray-300 rounded-full focus:outline-none focus:border-gray-400"
            />
            <button className="absolute inset-y-0 right-0 px-4 text-gray-700">
              <FaSearch />
            </button>
          </div>
        </div>

        {/* Cart & Account Icons (Desktop) */}
        <div className="hidden md:flex items-center space-x-4">
          <FaShoppingCart size={20} className="text-gray-700 hover:text-gray-900" />
          <FaUser size={20} className="text-gray-700 hover:text-gray-900" />
        </div>
      </div>

      {/* Menus (Desktop, Aligned Left) */}
      <nav className="hidden md:flex justify-start space-x-8 text-base lg:text-sm px-4 py-2 lg:px-6 xl:px-8">
        <NavLink to="/" label="Home" currentPath={location.pathname} />
        <NavLink to="/products-page" label="Products" currentPath={location.pathname} />
        <NavLink to="/contact" label="Contact" currentPath={location.pathname} />
      </nav>

      {/* Mobile Menu */}
      {isMenuOpen && (
        <div className="md:hidden bg-white shadow-lg">
          <nav className="flex flex-col space-y-2 px-4 py-4">
            <NavLink to="/" label="Home" currentPath={location.pathname} />
            <NavLink to="/products-page" label="Products" currentPath={location.pathname} />
            <NavLink to="/contact" label="Contact" currentPath={location.pathname} />

            {/* Search Bar (Mobile) */}
            <div className="mt-4">
              <div className="relative">
                <input
                  type="text"
                  placeholder="Search products"
                  className="block w-full py-2 px-4 pr-12 border border-gray-300 rounded-full focus:outline-none focus:border-gray-400"
                />
                <button className="absolute inset-y-0 right-0 px-4 text-gray-700">
                  <FaSearch />
                </button>
              </div>
            </div>

            {/* Cart & Account Icons (Mobile) */}
            <div className="flex items-center space-x-4 mt-4">
              <FaShoppingCart size={20} className="text-gray-700" />
              <FaUser size={20} className="text-gray-700" />
            </div>
          </nav>
        </div>
      )}
    </header>
  );
};

// Custom NavLink Component
const NavLink = ({ to, label, currentPath }) => {
  const isActive = currentPath === to; // Determine if the link is active

  return (
    <Link to={to} className="relative group">
      <span className={`hover:text-gray-600 ${isActive ? 'text-gray-600' : ''}`}>
        {label}
      </span>
      <span
        className={`absolute left-0 -bottom-1 h-[2px] w-full bg-gray-600 transition-transform duration-300 ${
          isActive ? 'scale-x-100' : 'scale-x-0'
        } group-hover:scale-x-100`}
      ></span>
    </Link>
  );
};

export default NavBar;
