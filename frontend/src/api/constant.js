const getApiBaseUrl = () => {
  if (process.env.REACT_APP_API_URL) {
    return process.env.REACT_APP_API_URL;
  }
  if (typeof window !== "undefined" && window.location && window.location.hostname) {
    if (window.location.hostname === "localhost" || window.location.hostname === "127.0.0.1") {
      return `http://${window.location.hostname}:8000`;
    }
  }
  return "https://learning-management-deployed.onrender.com";
};

export const API_BASE_URL = getApiBaseUrl();
