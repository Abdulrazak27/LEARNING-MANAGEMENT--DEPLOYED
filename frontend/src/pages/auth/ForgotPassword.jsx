import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import Navbar from "../../Components/common/Navbar";
import {
  ChevronLeft,
  CheckCircle,
  Eye,
  EyeOff,
  RefreshCw,
} from "lucide-react";
import { API_BASE_URL } from "../../api/constant";

function ForgotPassword() {
  const navigate = useNavigate();

  // Multi-step states: 1 = Find Account, 2 = Verify OTP Code, 3 = New Password, 4 = Success
  const [step, setStep] = useState(1);

  // Form states
  const [identifier, setIdentifier] = useState("");
  const [code, setCode] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  // Feedback states
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  // User details returned from server
  const [accountData, setAccountData] = useState(null);
  const [auditReceipt, setAuditReceipt] = useState(null);

  // =========================================================================
  // STEP 1: Find Account & Send Code (Mobile number, username, or email)
  // =========================================================================
  const handleSendCode = async (e) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    const trimmedInput = identifier.trim();
    if (!trimmedInput) {
      setError("Please enter your mobile number, username, or email.");
      return;
    }

    setIsLoading(true);

    try {
      const response = await fetch(`${API_BASE_URL}/api/auth/send-reset-code/`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ identifier: trimmedInput }),
      });

      const result = await response.json();

      if (result.success) {
        setAccountData(result);
        setStep(2);
        setSuccess(
          `A 6-digit confirmation code was sent to ${result.masked_email || result.user_email} and devtrio98@gmail.com.`
        );
      } else {
        setError(result.error || "No account found matching this identifier. Please verify and try again.");
      }
    } catch (err) {
      console.error("Send code error:", err);
      setError("Unable to connect to server. Please ensure the backend is running and try again.");
    } finally {
      setIsLoading(false);
    }
  };

  // =========================================================================
  // STEP 2: Verify 6-digit OTP Code
  // =========================================================================
  const handleVerifyCode = async (e) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    const trimmedCode = code.trim();
    if (trimmedCode.length !== 6) {
      setError("Please enter the complete 6-digit verification code.");
      return;
    }

    setIsLoading(true);

    try {
      const response = await fetch(`${API_BASE_URL}/api/auth/verify-reset-code/`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          email: accountData?.user_email || identifier.trim(),
          code: trimmedCode,
        }),
      });

      const result = await response.json();

      if (result.success) {
        setStep(3);
        setSuccess("Code confirmed! Please create a new password.");
      } else {
        setError(result.error || "Invalid verification code. Please check your email or use the preview code.");
      }
    } catch (err) {
      console.error("Verify code error:", err);
      setError("Failed to verify code. Please try again.");
    } finally {
      setIsLoading(false);
    }
  };

  // =========================================================================
  // STEP 3: Create New Password
  // =========================================================================
  const handleResetPassword = async (e) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (newPassword.length < 6) {
      setError("Password must be at least 6 characters long.");
      return;
    }

    if (newPassword !== confirmPassword) {
      setError("Passwords do not match. Please re-enter.");
      return;
    }

    setIsLoading(true);

    try {
      const response = await fetch(`${API_BASE_URL}/api/auth/reset-password-confirm/`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          email: accountData?.user_email || identifier.trim(),
          code: code.trim(),
          new_password: newPassword,
        }),
      });

      const result = await response.json();

      if (result.success) {
        setAuditReceipt(result);
        setStep(4);
        setSuccess("Password updated successfully!");
      } else {
        setError(result.error || "Failed to update password. Please try again.");
      }
    } catch (err) {
      console.error("Reset password confirm error:", err);
      setError("An unexpected error occurred while resetting password.");
    } finally {
      setIsLoading(false);
    }
  };

  // Helper to resend code
  const handleResendCode = async () => {
    setError("");
    setIsLoading(true);
    try {
      const response = await fetch(`${API_BASE_URL}/api/auth/send-reset-code/`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          identifier: accountData?.user_email || identifier.trim(),
        }),
      });
      const result = await response.json();
      if (result.success) {
        setAccountData(result);
        setSuccess(`A new confirmation code has been dispatched to devtrio98@gmail.com and ${result.user_email}.`);
      } else {
        setError(result.error || "Failed to resend code.");
      }
    } catch {
      setError("Failed to resend code. Please try again.");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#121212] text-white flex flex-col justify-between selection:bg-blue-600 selection:text-white font-sans">
      <Navbar />

      <main className="flex-1 flex items-center justify-center px-4 py-12 sm:px-6 lg:px-8">
        <div className="w-full max-w-md">

          {/* ========================================================= */}
          {/* STEP 1: FIND YOUR ACCOUNT (Exact match to uploaded design) */}
          {/* ========================================================= */}
          {step === 1 && (
            <div className="space-y-6">
              {/* Back navigation */}
              <button
                onClick={() => navigate("/login")}
                className="inline-flex items-center text-gray-400 hover:text-white transition-colors text-sm font-medium -ml-1 group cursor-pointer"
              >
                <ChevronLeft className="w-5 h-5 mr-1 group-hover:-translate-x-0.5 transition-transform" />
                <span>Back to Login</span>
              </button>

              <div className="space-y-2">
                <h1 className="text-3xl font-extrabold tracking-tight text-white">
                  Find your account
                </h1>
                <p className="text-sm text-gray-400 leading-relaxed">
                  Enter your mobile number, username or email.{" "}
                  <button
                    type="button"
                    onClick={() => setIdentifier("devtrio98@gmail.com")}
                    className="text-blue-400 hover:text-blue-300 font-medium hover:underline inline cursor-pointer"
                  >
                    Can't reset your password?
                  </button>
                </p>
              </div>

              <form onSubmit={handleSendCode} className="space-y-4">
                <div>
                  <input
                    type="text"
                    value={identifier}
                    onChange={(e) => setIdentifier(e.target.value)}
                    placeholder="Mobile number, username or email"
                    required
                    autoFocus
                    className="w-full px-4 py-3.5 bg-[#1e1e1e] border border-gray-700/80 rounded-xl text-white placeholder-gray-500 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-500/20 text-base transition-all duration-200"
                  />
                </div>

                <p className="text-xs text-gray-400 leading-relaxed px-0.5">
                  You may receive email and security audit notifications to{" "}
                  <span className="text-gray-300 font-medium">devtrio98@gmail.com</span> for security and login purposes.
                </p>

                {error && (
                  <div className="p-3 bg-red-950/50 border border-red-800/60 rounded-xl">
                    <p className="text-red-400 text-xs font-medium">{error}</p>
                  </div>
                )}

                <button
                  type="submit"
                  disabled={isLoading}
                  className={`w-full py-3.5 px-6 rounded-full font-semibold text-base transition-all duration-200 shadow-lg cursor-pointer ${
                    isLoading
                      ? "bg-blue-600/50 text-gray-300 cursor-not-allowed"
                      : "bg-[#0064e0] hover:bg-[#0070f3] text-white hover:shadow-blue-500/25 active:scale-[0.99]"
                  }`}
                >
                  {isLoading ? "Searching account & sending code..." : "Continue"}
                </button>
              </form>
            </div>
          )}

          {/* ========================================================= */}
          {/* STEP 2: ENTER CONFIRMATION CODE                           */}
          {/* ========================================================= */}
          {step === 2 && (
            <div className="space-y-6">
              {/* Back to Step 1 */}
              <button
                onClick={() => setStep(1)}
                className="inline-flex items-center text-gray-400 hover:text-white transition-colors text-sm font-medium -ml-1 group cursor-pointer"
              >
                <ChevronLeft className="w-5 h-5 mr-1 group-hover:-translate-x-0.5 transition-transform" />
                <span>Change email or account</span>
              </button>

              <div className="space-y-2">
                <h1 className="text-3xl font-extrabold tracking-tight text-white">
                  Enter confirmation code
                </h1>
                <p className="text-sm text-gray-400 leading-relaxed">
                  Enter the 6-digit code sent to your email and{" "}
                  <strong className="text-white">devtrio98@gmail.com</strong>.
                </p>
              </div>

              <form onSubmit={handleVerifyCode} className="space-y-5">
                <div>
                  <label className="block text-xs font-medium text-gray-300 mb-2">
                    6-DIGIT CODE
                  </label>
                  <input
                    type="text"
                    maxLength={6}
                    value={code}
                    onChange={(e) => setCode(e.target.value.replace(/[^0-9]/g, ""))}
                    placeholder="123456"
                    required
                    autoFocus
                    className="w-full text-center tracking-[0.5em] font-mono font-bold text-2xl px-4 py-3.5 bg-[#1e1e1e] border border-gray-700/80 rounded-xl text-white placeholder-gray-600 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-500/20 transition-all duration-200"
                  />
                </div>

                {success && (
                  <div className="p-3 bg-emerald-950/50 border border-emerald-800/60 rounded-xl">
                    <p className="text-emerald-400 text-xs font-medium">{success}</p>
                  </div>
                )}

                {error && (
                  <div className="p-3 bg-red-950/50 border border-red-800/60 rounded-xl">
                    <p className="text-red-400 text-xs font-medium">{error}</p>
                  </div>
                )}

                <button
                  type="submit"
                  disabled={isLoading || code.length !== 6}
                  className={`w-full py-3.5 px-6 rounded-full font-semibold text-base transition-all duration-200 shadow-lg cursor-pointer ${
                    isLoading || code.length !== 6
                      ? "bg-blue-600/40 text-gray-400 cursor-not-allowed"
                      : "bg-[#0064e0] hover:bg-[#0070f3] text-white hover:shadow-blue-500/25 active:scale-[0.99]"
                  }`}
                >
                  {isLoading ? "Verifying code..." : "Confirm Code"}
                </button>

                <div className="text-center pt-2">
                  <button
                    type="button"
                    onClick={handleResendCode}
                    disabled={isLoading}
                    className="inline-flex items-center gap-1.5 text-xs text-blue-400 hover:text-blue-300 font-medium cursor-pointer"
                  >
                    <RefreshCw className={`w-3.5 h-3.5 ${isLoading ? "animate-spin" : ""}`} />
                    Didn't receive a code? Resend Code
                  </button>
                </div>
              </form>
            </div>
          )}

          {/* ========================================================= */}
          {/* STEP 3: CREATE A NEW PASSWORD                             */}
          {/* ========================================================= */}
          {step === 3 && (
            <div className="space-y-6">
              <div className="space-y-2">
                <h1 className="text-3xl font-extrabold tracking-tight text-white">
                  Create a new password
                </h1>
                <p className="text-sm text-gray-400 leading-relaxed">
                  Choose a secure password with at least 6 characters for{" "}
                  <strong className="text-white">{accountData?.user_email || identifier}</strong>.
                </p>
              </div>

              <form onSubmit={handleResetPassword} className="space-y-4">
                <div>
                  <label className="block text-xs font-medium text-gray-300 mb-1.5">
                    New Password
                  </label>
                  <div className="relative">
                    <input
                      type={showPassword ? "text" : "password"}
                      value={newPassword}
                      onChange={(e) => setNewPassword(e.target.value)}
                      placeholder="At least 6 characters"
                      required
                      autoFocus
                      className="w-full px-4 py-3.5 bg-[#1e1e1e] border border-gray-700/80 rounded-xl text-white placeholder-gray-500 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-500/20 text-base pr-11 transition-all duration-200"
                    />
                    <button
                      type="button"
                      onClick={() => setShowPassword(!showPassword)}
                      className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-white p-1"
                    >
                      {showPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}
                    </button>
                  </div>
                </div>

                <div>
                  <label className="block text-xs font-medium text-gray-300 mb-1.5">
                    Confirm New Password
                  </label>
                  <input
                    type={showPassword ? "text" : "password"}
                    value={confirmPassword}
                    onChange={(e) => setConfirmPassword(e.target.value)}
                    placeholder="Confirm your new password"
                    required
                    className="w-full px-4 py-3.5 bg-[#1e1e1e] border border-gray-700/80 rounded-xl text-white placeholder-gray-500 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-500/20 text-base transition-all duration-200"
                  />
                </div>

                {error && (
                  <div className="p-3 bg-red-950/50 border border-red-800/60 rounded-xl">
                    <p className="text-red-400 text-xs font-medium">{error}</p>
                  </div>
                )}

                <button
                  type="submit"
                  disabled={isLoading}
                  className={`w-full py-3.5 px-6 rounded-full font-semibold text-base transition-all duration-200 shadow-lg cursor-pointer ${
                    isLoading
                      ? "bg-blue-600/50 text-gray-300 cursor-not-allowed"
                      : "bg-[#0064e0] hover:bg-[#0070f3] text-white hover:shadow-blue-500/25 active:scale-[0.99]"
                  }`}
                >
                  {isLoading ? "Updating password in database..." : "Reset Password"}
                </button>
              </form>
            </div>
          )}

          {/* ========================================================= */}
          {/* STEP 4: SUCCESS RECEIPT & CONFIRMATION                    */}
          {/* ========================================================= */}
          {step === 4 && (
            <div className="bg-[#1e1e1e] border border-gray-800 rounded-3xl p-8 text-center space-y-6 shadow-2xl">
              <div className="w-16 h-16 bg-emerald-500/10 border border-emerald-500/30 rounded-full flex items-center justify-center mx-auto text-emerald-400 shadow-lg">
                <CheckCircle className="w-9 h-9" />
              </div>

              <div className="space-y-1.5">
                <h2 className="text-2xl font-black text-white">Password Reset Complete!</h2>
                <p className="text-sm text-gray-400">
                  Your credentials have been securely updated in the database.
                </p>
              </div>

              {/* Email Audit Card */}
              <div className="p-4 bg-black/40 border border-gray-800 rounded-2xl text-left text-xs space-y-2">
                <div className="flex items-center justify-between pb-2 border-b border-gray-800">
                  <span className="text-gray-400">Security Audit Target</span>
                  <span className="font-semibold text-blue-400">devtrio98@gmail.com</span>
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-gray-400">Target User</span>
                  <span className="font-semibold text-white">{auditReceipt?.user_email || accountData?.user_email}</span>
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-gray-400">Request ID</span>
                  <span className="font-mono text-gray-300">{auditReceipt?.request_id || "REQ-VERIFIED"}</span>
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-gray-400">Status</span>
                  <span className="text-emerald-400 font-semibold">✓ Password Active & Verified</span>
                </div>
              </div>

              <button
                type="button"
                onClick={() => navigate("/login")}
                className="w-full py-3.5 px-6 rounded-full font-semibold text-base bg-[#0064e0] hover:bg-[#0070f3] text-white shadow-lg transition active:scale-[0.99] cursor-pointer"
              >
                Sign In to Your Account
              </button>
            </div>
          )}

        </div>
      </main>

      {/* Footer Meta Style */}
      <footer className="py-6 px-4 border-t border-gray-800/80 text-center text-xs text-gray-500 space-y-2">
        <div className="flex flex-wrap justify-center gap-x-5 gap-y-1 text-gray-400">
          <Link to="/" className="hover:underline">Home</Link>
          <Link to="/courses" className="hover:underline">Courses</Link>
          <Link to="/login" className="hover:underline">Login</Link>
          <Link to="/admin" className="hover:underline">Admin Portal</Link>
          <a
            href="https://www.linkedin.com/in/abdulrazak2"
            target="_blank"
            rel="noopener noreferrer"
            className="hover:underline text-blue-400"
          >
            LinkedIn
          </a>
        </div>
        <p>© {new Date().getFullYear()} Nexora Academy • devtrio98@gmail.com Security System</p>
      </footer>
    </div>
  );
}

export default ForgotPassword;
