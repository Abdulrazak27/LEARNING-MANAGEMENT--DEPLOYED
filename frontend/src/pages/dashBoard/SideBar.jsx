import React from "react";
import { useNavigate } from "react-router-dom";
import img1 from "../../assets/images/user.png";
import {
  LayoutDashboard,
  Users,
  BookOpen,
  HelpCircle,
  GraduationCap,
  MessageSquare,
  LogOut,
  ExternalLink,
  ShieldCheck,
} from "lucide-react";

function SideBar({ current, onSelect, onLogout }) {
  const navigate = useNavigate();

  const menuItems = [
    { key: "dashboard", label: "Dashboard", icon: LayoutDashboard },
    { key: "user", label: "Users", icon: Users },
    { key: "courses", label: "Courses", icon: BookOpen },
    { key: "quizzes", label: "Quizzes & Questions", icon: HelpCircle },
    { key: "enrollments", label: "Enrollments & Progress", icon: GraduationCap },
    { key: "feedback", label: "Reviews & Feedback", icon: MessageSquare },
  ];

  return (
    <aside className="w-64 bg-white shadow-xl flex flex-col justify-between min-h-screen border-r border-slate-100 z-20">
      <div>
        {/* Brand / Admin Profile Header */}
        <div
          className="p-5 border-b border-slate-100 flex items-center gap-3 cursor-pointer bg-gradient-to-r from-blue-50/50 to-indigo-50/50 hover:bg-indigo-50 transition"
          onClick={() => onSelect("dashboard")}
        >
          <div className="relative">
            <img
              src={img1}
              alt="Admin Logo"
              className="w-11 h-11 rounded-xl object-cover border-2 border-indigo-500/30 shadow-sm"
            />
            <span className="absolute -bottom-1 -right-1 w-3.5 h-3.5 bg-emerald-500 border-2 border-white rounded-full"></span>
          </div>
          <div>
            <div className="flex items-center gap-1.5">
              <span className="font-bold text-slate-900 text-base">LMS Admin</span>
              <ShieldCheck className="w-4 h-4 text-purple-600" />
            </div>
            <span className="text-[11px] font-semibold text-purple-700 bg-purple-100 px-2 py-0.5 rounded-full inline-block">
              Super Admin
            </span>
          </div>
        </div>

        {/* Navigation Items */}
        <div className="px-3 py-5">
          <p className="px-3 text-[11px] font-bold text-slate-400 uppercase tracking-wider mb-2">
            Management Console
          </p>
          <ul className="space-y-1">
            {menuItems.map((item) => {
              const Icon = item.icon;
              const isActive = current === item.key;
              return (
                <li key={item.key}>
                  <button
                    onClick={() => onSelect(item.key)}
                    className={`w-full flex items-center gap-3 px-3.5 py-3 rounded-xl font-medium text-sm transition-all duration-200 cursor-pointer ${
                      isActive
                        ? "bg-blue-600 text-white shadow-md shadow-blue-500/25 font-semibold translate-x-1"
                        : "text-slate-600 hover:bg-slate-50 hover:text-slate-900"
                    }`}
                  >
                    <Icon className={`w-5 h-5 ${isActive ? "text-white" : "text-slate-500"}`} />
                    <span>{item.label}</span>
                  </button>
                </li>
              );
            })}
          </ul>
        </div>
      </div>

      {/* Footer Navigation & Logout */}
      <div className="p-4 border-t border-slate-100 bg-slate-50/50 space-y-2">
        {/* Back to LMS Website */}
        <button
          onClick={() => navigate("/")}
          className="w-full flex items-center justify-between px-3 py-2.5 rounded-xl text-xs font-semibold text-slate-700 bg-white hover:bg-slate-100 border border-slate-200 transition shadow-sm cursor-pointer"
          title="Return to the main learner website"
        >
          <span className="flex items-center gap-2">
            <ExternalLink className="w-4 h-4 text-indigo-600" />
            Back to LMS Website
          </span>
          <span className="text-gray-400 text-xs">↗</span>
        </button>

        {/* Logout Admin */}
        <button
          onClick={onLogout}
          className="w-full flex items-center justify-center gap-2 px-3 py-2.5 rounded-xl text-xs font-bold text-red-700 bg-red-50 hover:bg-red-100 border border-red-200 transition cursor-pointer"
          title="Sign out of Administrator Console"
        >
          <LogOut className="w-4 h-4 text-red-600" />
          <span>Sign Out Admin</span>
        </button>
      </div>
    </aside>
  );
}

export default SideBar;
