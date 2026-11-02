import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import logo from "../../assets/images/logo1.png";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faUser, faChalkboardUser, faShieldHalved } from "@fortawesome/free-solid-svg-icons";
import { authService } from "../../api/auth.service";
import { useUserContext } from "../../contexts/UserContext";

function Navbar(props) {
  const value = props.page;
  const navigate = useNavigate();
  const { isAuthenticated, user, setUser } = useUserContext();
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

  const role = user?.role || localStorage.getItem("role") || "";
  const isAdmin = role === "ADMIN" || role === "ROLE_ADMIN";

  const handleLogOut = async () => {
    await authService.logout();
    setUser(null);
    navigate("/login");
  };

  const toggleMobileMenu = () => setIsMobileMenuOpen(!isMobileMenuOpen);
  const closeMobileMenu = () => setIsMobileMenuOpen(false);

  return (
    <div>
      <nav className="bg-white w-full flex flex-row justify-between items-center px-[4vw] py-2 shadow-[2px_2px_10px_rgba(0,0,0,0.15)] z-[999]">

        {/* LOGO - FIXED SIZE */}
        <Link to="/" className="flex items-center">
          <img
            src={logo}
            alt="Nexora Logo"
            style={{ height: "70px", width: "auto", objectFit: "contain" }}
            className="cursor-pointer hover:opacity-95 transition"
          />
        </Link>

        <div className="flex">
          <div id="menu-btn" className="hidden">
            <div className="menu-dash" onClick={toggleMobileMenu}>&#9776;</div>
          </div>
          <i id="menu-close" className="fas fa-times hidden" onClick={closeMobileMenu}></i>

          <ul className={`flex justify-end items-center ${isMobileMenuOpen ? "active" : ""}`}>

            {isMobileMenuOpen && (
              <li className="close-button">
                <button onClick={closeMobileMenu}>X</button>
              </li>
            )}

            {/* HOME */}
            {value === "home" ? (
              <li className="list-none ml-5 rounded-[5px] bg-gradient-to-r from-blue-600 to-purple-600">
                <Link to={"/"} className="no-underline text-white text-[17px] font-bold px-[10px] py-[2px] block hover:text-yellow-400">
                  Home
                </Link>
              </li>
            ) : (
              <li className="list-none ml-5">
                <Link to={"/"} className="no-underline text-[rgb(21,21,100)] text-[17px] font-bold hover:text-yellow-400">
                  Home
                </Link>
              </li>
            )}

            {/* COURSES */}
            {value === "courses" ? (
              <li className="list-none ml-5 rounded-[5px] bg-gradient-to-r from-blue-600 to-purple-600">
                <Link to={"/courses"} className="no-underline text-white text-[17px] font-bold px-[10px] py-[2px] block hover:text-yellow-400">
                  Courses
                </Link>
              </li>
            ) : (
              <li className="list-none ml-5">
                <Link to={"/courses"} className="no-underline text-[rgb(21,21,100)] text-[17px] font-bold hover:text-yellow-400">
                  Courses
                </Link>
              </li>
            )}

            {/* PROFILE */}
            {isAuthenticated && (
              value === "profile" ? (
                <li className="list-none ml-5 rounded-[5px] bg-gradient-to-r from-blue-600 to-purple-600">
                  <Link to={"/profile"} className="no-underline text-white text-[17px] font-bold px-[10px] py-[2px] block hover:text-yellow-400">
                    Profile <FontAwesomeIcon icon={faUser} className="ml-1" />
                  </Link>
                </li>
              ) : (
                <li className="list-none ml-5">
                  <Link to={"/profile"} className="no-underline text-[rgb(21,21,100)] text-[17px] font-bold hover:text-yellow-400">
                    Profile <FontAwesomeIcon icon={faUser} className="ml-1" />
                  </Link>
                </li>
              )
            )}

            {/* LEARNINGS */}
            {isAuthenticated && (
              value === "learnings" ? (
                <li className="list-none ml-5 rounded-[5px] bg-gradient-to-r from-blue-600 to-purple-600">
                  <Link to={"/learnings"} className="no-underline text-white text-[17px] font-bold px-[10px] py-[2px] block hover:text-yellow-400">
                    Learnings <FontAwesomeIcon icon={faChalkboardUser} className="ml-1" />
                  </Link>
                </li>
              ) : (
                <li className="list-none ml-5">
                  <Link to={"/learnings"} className="no-underline text-[rgb(21,21,100)] text-[17px] font-bold hover:text-yellow-400">
                    Learnings <FontAwesomeIcon icon={faChalkboardUser} className="ml-1" />
                  </Link>
                </li>
              )
            )}

            {/* ADMIN LINK IF LOGGED IN AS ADMIN */}
            {isAuthenticated && isAdmin && (
              <li className="list-none ml-5">
                <Link
                  to={"/admin"}
                  className="no-underline text-purple-700 bg-purple-50 hover:bg-purple-100 border border-purple-300 px-3 py-1.5 rounded-lg text-[15px] font-bold flex items-center gap-1.5 transition shadow-sm"
                >
                  <FontAwesomeIcon icon={faShieldHalved} className="text-purple-600" />
                  Admin
                </Link>
              </li>
            )}

            {/* LOGIN / LOGOUT & ADMIN BUTTON */}
            {isAuthenticated ? (
              <li className="list-none ml-5">
                <button
                  onClick={handleLogOut}
                  className="w-[120px] h-[35px] bg-[#0047ca] rounded-lg text-white text-[15px] hover:bg-[#002c5fe1]"
                >
                  Sign Out
                </button>
              </li>
            ) : (
              <li className="list-none ml-5 flex items-center gap-3">
                <button
                  onClick={() => navigate("/login")}
                  className="w-[120px] h-[35px] bg-[#0047ca] rounded-lg text-white text-[15px] font-semibold hover:bg-[#002c5fe1] transition"
                >
                  Login/SignUp
                </button>
                <button
                  onClick={() => navigate("/admin")}
                  className="px-3.5 h-[35px] bg-gradient-to-r from-purple-600 to-indigo-600 rounded-lg text-white text-[14px] font-semibold hover:from-purple-700 hover:to-indigo-700 shadow-md transition flex items-center justify-center gap-1.5"
                  title="Admin Control Center"
                >
                  <FontAwesomeIcon icon={faShieldHalved} className="text-xs" />
                  Admin Login
                </button>
              </li>
            )}

          </ul>
        </div>
      </nav>
    </div>
  );
}

export default Navbar;