import axios from 'axios';

const instance = axios.create({
  baseURL: process.env.REACT_APP_BASE_URL, // Replace with your backend server URL
//  withCredentials: true, // This will send the cookie with every request
});


// Add a response interceptor
instance.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    // Handle error globally
    console.log('Axios error:', error);
    return Promise.reject(error);
  }
);

// Set up response interceptor
instance.interceptors.response.use(
  (response) => response,
  (error) => {
    if(error.response){
    const { status } = error.response;
    if (status === 401 || status === 403) {
      // Perform logout logic in your React application
      // Clear authentication state, redirect to login page, etc.
      // Example: clear token from local storage and redirect to login page
      // localStorage.removeItem('encodedCredentials');
      sessionStorage.removeItem('encodedCredentials');
      window.location.href = '/';
    }
    return Promise.reject(error);
  }else{
    //window.location.href = '/error';
    return Promise.reject(error);
  }
  }
);
export default instance;
