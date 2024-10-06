import React, { useEffect } from "react";

export default function ProductsPage() {
  useEffect(() => {
    getProducts();
  }, []);
  const getProducts = async () => {
    const token =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI5Njg4MzM2MTEwIiwiaWF0IjoxNzI4MTMyMDY4LCJleHAiOjE3MjgxMzI2NzMsImp0aSI6IjU5OGQ5OTg4LThlODEtNDk5OC04MmU0LTI0NTI4ODY5ZTcxOSJ9.D9cPKm_JC7ORU42twwLuF-lPj4sWt7QsmX9o-ok2Ygg"; // Replace with your actual JWT token

    try {
      const response = await fetch("http://localhost:8080/api/v1/products", {
        method: "GET", // HTTP method
        headers: {
          Authorization: `Bearer ${token}`, // Add the Authorization header
          "Content-Type": "application/json", // Specify content type
        },
      });

      // Check if the response was successful
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json(); // Parse response data
      console.log("this is the response data", data); // Log the response data
    } catch (error) {
      console.error("Error fetching products:", error); // Log any errors
    }
  };

  return <div>Products Page</div>;
}
