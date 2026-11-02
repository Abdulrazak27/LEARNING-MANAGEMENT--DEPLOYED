import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { message } from "antd";
import SideBar from "./SideBar";
import Dashboard from "./Dashboard";
import Users from "./DUsers";
import Courses from "./DCourses";
import DQuestions from "./DQuestions";
import DEnrollments from "./DEnrollments";
import DFeedback from "./DFeedback";
import { authService } from "../../api/auth.service";
import {
  ShieldCheck,
  Lock,
  User,
  ArrowLeft,
  LogIn,
  LogOut,
  ExternalLink,
  Eye,
  EyeOff,
} from "lucide-react";

function AdminDashboard() {
  const navigate = useNavigate();
  const [current, setCurrent] = useState("dashboard");

  // Require explicit active admin session or valid ADMIN role in storage
  const isInitiallyAdmin = () => {
    const role = localStorage.getItem("role");
    const token = localStorage.getItem("token");
    const sessionActive = sessionStorage.getItem("admin_session_active");
    return !!token && (role === "ADMIN" || role === "ROLE_ADMIN") && sessionActive === "true";
  };

  const [isAuthenticated, setIsAuthenticated] = useState(isInitiallyAdmin);
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [error, setError] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  const adminName = localStorage.getItem("name") || "Administrator";
  const adminEmail = localStorage.getItem("email") || "admin@gmail.com";

  const renderContent = () => {
    switch (current) {
      case "dashboard":
        return <Dashboard isAuthenticated={isAuthenticated} />;
      case "user":
        return <Users />;
      case "courses":
        return <Courses />;
      case "quizzes":
        return <DQuestions />;
      case "enrollments":
        return <DEnrollments />;
      case "feedback":
        return <DFeedback />;
      default:
        return <Dashboard isAuthenticated={isAuthenticated} />;
    }
  };

  const handleLogin = async (e) => {
    e.preventDefault();
    setError("");
    setIsLoading(true);

    try {
      const result = await authService.login(username.trim(), password.trim());

      if (result.success && (result.user.role === "ADMIN" || result.user.role === "ROLE_ADMIN")) {
        sessionStorage.setItem("admin_session_active", "true");
        setIsAuthenticated(true);
        setError("");
        message.success(`Welcome back, ${result.user.name || "Administrator"}!`);
      } else if (result.success) {
        setError("Access Denied: This account has 'USER' role and does not have administrator privileges.");
      } else {
        setError(result.error || "Invalid administrator credentials. Please check and try again.");
      }
    } catch {
      setError("Server connection failed. Please ensure the backend is running.");
    } finally {
      setIsLoading(false);
    }
  };

  const handleLogout = () => {
    sessionStorage.removeItem("admin_session_active");
    setIsAuthenticated(false);
    message.info("Administrator logged out successfully.");
  };

  // =========================================================================
  // VIEW 1: DEDICATED ADMIN LOGIN SCREEN (If not authenticated as admin)
  // =========================================================================
  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-900 via-indigo-950 to-slate-900 flex flex-col justify-between p-4 sm:p-8 font-sans selection:bg-purple-600 selection:text-white">
        {/* Top return link */}
        <div className="max-w-md w-full mx-auto flex items-center justify-between">
          <button
            onClick={() => navigate("/")}
            className="inline-flex items-center gap-2 text-indigo-200 hover:text-white text-sm font-semibold transition cursor-pointer"
          >
            <ArrowLeft className="w-4 h-4" />
            <span>Back to LMS Website</span>
          </button>

          <span className="text-xs text-indigo-300 bg-white/10 px-3 py-1 rounded-full border border-white/10">
            Nexora Admin Portal
          </span>
        </div>

        {/* Main Login Card */}
        <div className="max-w-md w-full mx-auto my-8">
          <div className="bg-white/10 backdrop-blur-2xl rounded-3xl shadow-2xl p-8 sm:p-10 border border-white/20 text-white">
            {/* Header Icon */}
            <div className="text-center mb-6">
              <div className="mx-auto w-16 h-16 bg-gradient-to-tr from-purple-600 to-indigo-600 rounded-2xl flex items-center justify-center shadow-lg shadow-purple-500/30 mb-4">
                <ShieldCheck className="w-9 h-9 text-white" />
              </div>
              <h2 className="text-3xl font-extrabold tracking-tight text-white">
                Admin Control Center
              </h2>
              <p className="text-xs text-indigo-200 mt-1">
                Enter your administrator credentials to access the management portal
              </p>
            </div>

            {/* Login Form */}
            <form onSubmit={handleLogin} className="space-y-4">
              <div>
                <label className="block text-xs font-semibold uppercase tracking-wider text-indigo-200 mb-1.5">
                  Admin Username or Email
                </label>
                <div className="relative">
                  <div className="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none">
                    <User className="h-4 w-4 text-indigo-300" />
                  </div>
                  <input
                    type="text"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                    required
                    placeholder="admin or devtrio98@gmail.com"
                    className="w-full pl-10 pr-4 py-3 bg-white/10 border border-white/20 rounded-xl text-white placeholder-indigo-300/60 focus:outline-none focus:ring-2 focus:ring-purple-400 text-sm transition"
                  />
                </div>
              </div>

              <div>
                <label className="block text-xs font-semibold uppercase tracking-wider text-indigo-200 mb-1.5">
                  Admin Password
                </label>
                <div className="relative">
                  <div className="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none">
                    <Lock className="h-4 w-4 text-indigo-300" />
                  </div>
                  <input
                    type={showPassword ? "text" : "password"}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    required
                    placeholder="admin@123"
                    className="w-full pl-10 pr-10 py-3 bg-white/10 border border-white/20 rounded-xl text-white placeholder-indigo-300/60 focus:outline-none focus:ring-2 focus:ring-purple-400 text-sm transition font-mono"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="absolute inset-y-0 right-0 pr-3.5 flex items-center text-indigo-300 hover:text-white cursor-pointer"
                  >
                    {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                  </button>
                </div>
              </div>

              {error && (
                <div className="p-3 bg-red-950/70 border border-red-500/60 rounded-xl">
                  <p className="text-red-300 text-xs font-medium text-center">{error}</p>
                </div>
              )}

              <button
                type="submit"
                disabled={isLoading}
                className="w-full py-3.5 px-6 rounded-xl font-bold text-sm bg-gradient-to-r from-purple-600 to-indigo-600 hover:from-purple-500 hover:to-indigo-500 text-white shadow-lg shadow-purple-600/30 transition-all cursor-pointer flex items-center justify-center gap-2 mt-2"
              >
                {isLoading ? (
                  <span>Authenticating Admin...</span>
                ) : (
                  <>
                    <LogIn className="w-4 h-4" />
                    <span>Enter Admin Portal</span>
                  </>
                )}
              </button>
            </form>
          </div>
        </div>

        {/* Footer */}
        <div className="text-center text-xs text-indigo-300/70">
          © {new Date().getFullYear()} Nexora LMS • Restricted Administrative Access Console
        </div>
      </div>
    );
  }

  // =========================================================================
  // VIEW 2: AUTHENTICATED ADMIN CONSOLE
  // =========================================================================
  return (
    <div className="flex min-h-screen bg-slate-50 font-sans">
      {/* Sidebar with 6 navigation tabs & Sign Out button */}
      <SideBar current={current} onSelect={setCurrent} onLogout={handleLogout} />

      {/* Main Content Area */}
      <div className="flex-1 flex flex-col min-w-0 overflow-hidden">
        {/* Top Admin Header Bar */}
        <header className="bg-white border-b border-slate-200 px-8 py-3.5 flex items-center justify-between sticky top-0 z-10 shadow-sm">
          <div className="flex items-center gap-3">
            <span className="text-xs font-bold uppercase tracking-wider text-purple-700 bg-purple-50 px-2.5 py-1 rounded-md border border-purple-200">
              Admin Console
            </span>
            <span className="text-slate-300">/</span>
            <span className="text-sm font-semibold text-slate-800 capitalize">
              {current === "dashboard"
                ? "Analytics Dashboard"
                : current === "user"
                ? "User Management"
                : current === "courses"
                ? "Course Catalog & Management"
                : current === "quizzes"
                ? "Quiz & Question Bank"
                : current === "enrollments"
                ? "Learner Enrollments"
                : "Student Feedback & Reviews"}
            </span>
          </div>

          <div className="flex items-center gap-3">
            {/* View website link */}
            <button
              onClick={() => navigate("/")}
              className="hidden sm:flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-semibold text-slate-600 hover:text-indigo-600 hover:bg-slate-100 transition cursor-pointer"
            >
              <ExternalLink className="w-3.5 h-3.5" />
              <span>Visit LMS Site</span>
            </button>

            {/* Admin identity pill */}
            <div className="flex items-center gap-2 pl-3 border-l border-slate-200">
              <div className="w-8 h-8 rounded-full bg-gradient-to-tr from-purple-600 to-indigo-600 text-white font-bold text-xs flex items-center justify-center shadow-sm">
                {(adminName[0] || "A").toUpperCase()}
              </div>
              <div className="hidden md:block text-left">
                <div className="text-xs font-bold text-slate-800 leading-tight">{adminName}</div>
                <div className="text-[10px] text-slate-500 font-mono leading-tight">{adminEmail}</div>
              </div>
            </div>

            {/* Logout button */}
            <button
              onClick={handleLogout}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-bold text-red-600 hover:bg-red-50 border border-red-200 transition cursor-pointer ml-2"
              title="Sign Out Admin"
            >
              <LogOut className="w-3.5 h-3.5" />
              <span className="hidden sm:inline">Logout</span>
            </button>
          </div>
        </header>

        {/* Dynamic Section Content */}
        <section className="flex-1 bg-gradient-to-br from-slate-50 via-indigo-50/40 to-slate-100 p-6 md:p-8 overflow-y-auto">
          {renderContent()}
        </section>
      </div>
    </div>
  );
}

export default AdminDashboard;
