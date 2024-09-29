import { Link } from 'react-router-dom';
import { FaBars, FaShoppingCart, FaUser, FaSearch } from 'react-icons/fa';
import { useState } from 'react';

const NavBar = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  return (
    <header className="bg-white shadow-lg">
      <div className="container mx-auto flex items-center justify-between h-24 px-4 lg:px-6 xl:px-8">
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
      <nav className="hidden md:flex justify-start space-x-8 font-semibold text-base lg:text-lg px-4 py-2 lg:px-6 xl:px-8">
        <Link to="/" className="hover:text-gray-600">
          Home
        </Link>
        <Link to="/about" className="hover:text-gray-600">
          About
        </Link>
        <Link to="/contact" className="hover:text-gray-600">
          Contact
        </Link>
      </nav>

      {/* Mobile Menu */}
      {isMenuOpen && (
        <div className="md:hidden bg-white shadow-lg">
          <nav className="space-y-2 px-4 py-4">
            <Link to="/" className="block hover:bg-gray-100 py-2">
              Home
            </Link>
            <Link to="/about" className="block hover:bg-gray-100 py-2">
              About
            </Link>
            <Link to="/contact" className="block hover:bg-gray-100 py-2">
              Contact
            </Link>
            
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

export default NavBar;
