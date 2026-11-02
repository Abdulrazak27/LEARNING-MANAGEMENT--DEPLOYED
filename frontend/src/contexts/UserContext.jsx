import React, { createContext, useContext, useState } from 'react';

const UserContext = createContext();

export const useUserContext = () => {
  return useContext(UserContext);
};

export const UserProvider = ({ children }) => {
  const [user, setUser] = useState({
    name: localStorage.getItem("name") || '',
    id: localStorage.getItem("id") || '',
    email: localStorage.getItem("email") || '',
    role: localStorage.getItem("role") || '',
    token: localStorage.getItem("token") || '',
  });

  // ✅ isAuthenticated is true if token exists
  const isAuthenticated = !!user.token;

  const setUserInfo = (userInfo) => {
    if (userInfo) {
      localStorage.setItem("name", userInfo.name || '');
      localStorage.setItem("id", userInfo.id || '');
      localStorage.setItem("email", userInfo.email || '');
      localStorage.setItem("role", userInfo.role || '');
      localStorage.setItem("token", userInfo.token || '');
      setUser(userInfo);
    } else {
      localStorage.clear();
      setUser({ name: '', id: '', email: '', role: '', token: '' });
    }
  };

  return (
    <UserContext.Provider value={{ user, setUser: setUserInfo, isAuthenticated }}>
      {children}
    </UserContext.Provider>
  );
};