import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faLinkedinIn,
} from "@fortawesome/free-brands-svg-icons";

function Footer() {
  return (
    <footer className="bg-gray-900 text-gray-300 py-10 px-6">
      <div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8 mb-8">
        {/* Master Courses */}
        <div>
          <h3 className="text-lg font-semibold text-white mb-4">
            Master Courses
          </h3>
          <ul className="space-y-2">
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                React.js Complete Guide
              </Link>
            </li>
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                Cloud Computing & DevOps
              </Link>
            </li>
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                Cybersecurity & Ethical Hacking
              </Link>
            </li>
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                Database Systems & SQL
              </Link>
            </li>
          </ul>
        </div>

        {/* Intermediate Courses */}
        <div>
          <h3 className="text-lg font-semibold text-white mb-4">
            Intermediate Courses
          </h3>
          <ul className="space-y-2">
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                Java Full Stack Development
              </Link>
            </li>
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                Machine Learning & AI
              </Link>
            </li>
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                JavaScript Mastery & ES6+
              </Link>
            </li>
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                Data Structures & Algorithms
              </Link>
            </li>
          </ul>
        </div>

        {/* Beginner Courses */}
        <div>
          <h3 className="text-lg font-semibold text-white mb-4">
            Beginner Courses
          </h3>
          <ul className="space-y-2">
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                Python Basics & Fundamentals
              </Link>
            </li>
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                Web Development Essentials
              </Link>
            </li>
            <li>
              <Link to="/courses" className="hover:text-white transition-colors text-gray-400 hover:underline block">
                Programming Concepts
              </Link>
            </li>
            <li>
              <Link to="/courses" className="hover:text-white text-indigo-400 font-semibold transition-colors block">
                Browse All 10 Courses →
              </Link>
            </li>
          </ul>
        </div>
      </div>

      {/* Copyright + Socials */}
      <div className="border-t border-gray-700 pt-6 flex flex-col md:flex-row justify-between items-center max-w-7xl mx-auto">
        <p className="text-sm">
          © {new Date().getFullYear()} All rights reserved.
        </p>
        <div className="flex space-x-4 mt-4 md:mt-0 items-center">
          <a
            href="https://www.linkedin.com/in/abdulrazak2"
            target="_blank"
            rel="noopener noreferrer"
            title="LinkedIn - Abdul Razak"
            className="w-10 h-10 flex items-center justify-center rounded-full bg-blue-600 hover:bg-blue-700 text-white transition shadow-md hover:scale-105"
          >
            <FontAwesomeIcon icon={faLinkedinIn} className="text-lg" />
          </a>
        </div>
      </div>
    </footer>
  );
}

export default Footer;