import React from 'react';

const ProductCard = ({ imageSrc, title, price, originalPrice, category, onAddToCart, label }) => {
  return (
    <div className="relative bg-white border rounded-lg shadow-md overflow-hidden w-full max-w-[200px] transition-transform transform hover:scale-105 hover:shadow-lg"> {/* Adjusted size and hover effects */}
      {/* Label at the top-left corner */}
      {label && (
        <div className="absolute top-0 left-0 bg-red-500 text-white px-2 py-1 text-xs font-semibold rounded-br-lg z-10">
          {label}
        </div>
      )}

      {/* Image section */}
      <div className="h-48 overflow-hidden"> {/* Slightly increased height */}
        <img
          src={imageSrc}
          alt={title}
          className="object-cover w-full h-full"
        />
      </div>

      {/* Content section */}
      <div className="p-3"> {/* Slightly increased padding */}
        <h3 className="text-sm font-semibold text-gray-800">{title}</h3>
        <p className="text-xs text-gray-500">{category}</p>

        {/* Price and Original Price section */}
        <div className="flex items-center space-x-2">
          {originalPrice && (
            <span className="text-xs text-gray-400 line-through">
              ₹{originalPrice}
            </span>
          )}
          <span className="text-sm font-bold text-gray-900">₹{price}</span>
        </div>

        {/* Add to Cart button */}
        <button
          onClick={onAddToCart}
          className="mt-3 w-full bg-blue-500 hover:bg-blue-600 text-white py-1.5 rounded-lg text-sm transition duration-300 ease-in-out"
        >
          Add to Cart
        </button>
      </div>
    </div>
  );
};

export default ProductCard;
