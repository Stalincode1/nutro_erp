import React from 'react';
import ProductCard from '../../components/ProductCard';
import BannerCarousel from '../../components/BannerCarousal';

// Update image imports to direct references
const Banner1 = '/banner1.jpg';
const Banner2 = '/banner2.jpg';
const Banner3 = '/banner3.jpg';
const Banner4 = '/banner4.jpg';

const badam = '/badam.jpg';
const cashew = '/cashew.jpg';
const wallnut = '/wallnut.jpg';
const chinesedates = '/chinesedates.jpg';
const dubaidates = '/dubaidates.jpg';

const products = [
    { id: 1, imageSrc: badam, title: 'Badam', price: '499.99', originalPrice: '599.99', category: 'Nuts', label: 'save 40%' },
    { id: 2, imageSrc: cashew, title: 'Cashew', price: '199.99', originalPrice: '249.99', category: 'Nuts', label: 'save 20%' },
    { id: 3, imageSrc: wallnut, title: 'Wall nut', price: '299.99', originalPrice: '399.99', category: 'Nuts', label: '' },
    { id: 4, imageSrc: chinesedates, title: 'Chinese Dates', price: '149.99', originalPrice: '', category: 'Dates', label: 'new' },
    { id: 5, imageSrc: dubaidates, title: 'Dubai Dates', price: '79.99', originalPrice: '99.99', category: 'Dates', label: '' }
];

const carouselImages = [
    { src: Banner1, alt: 'Slide 1' },
    { src: Banner2, alt: 'Slide 2' },
    { src: Banner3, alt: 'Slide 3' },
    { src: Banner4, alt: 'Slide 4' },
];

export default function Home() {
    const handleAddToCart = (product) => {
        alert(`${product.title} added to cart!`);
    };

    return (
        <>
            <BannerCarousel images={carouselImages} />
            <div className="container mx-auto px-4 pt-4 pb-10">
                <p className='mb-10'>Latest Products</p>
                <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-5 gap-4">
                    {products.map((product) => (
                        <ProductCard
                            key={product.id}
                            imageSrc={product.imageSrc}
                            title={product.title}
                            price={product.price}
                            originalPrice={product.originalPrice}
                            category={product.category}
                            label={product.label}
                            onAddToCart={() => handleAddToCart(product)}
                        />
                    ))}
                </div>
            </div>
        </>
    );
}
