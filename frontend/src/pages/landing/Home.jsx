import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import Navbar from "../../Components/common/Navbar";
import Footer from "../../Components/common/Footer";
import { faGraduationCap, faAward, faStar } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import c1 from "../../assets/images/c1.jpg";
import bannerImg from "../../assets/images/home-banner.png";
import { courseService } from "../../api/course.service";
import { learningService } from "../../api/learning.service";

function Home() {
  const navigate = useNavigate();
  const [timeLeft, setTimeLeft] = useState({ days: 0, hours: 0, minutes: 0, seconds: 0 });
  const [courses, setCourses] = useState([]);
  const [enrolled, setEnrolled] = useState([]);
  const userId = localStorage.getItem("id");

  useEffect(() => {
    async function loadCourses() {
      try {
        const res = await courseService.getAllCourses();
        if (res.success && Array.isArray(res.data)) {
          setCourses(res.data);
        }
      } catch (err) {
        console.error("Failed to load courses on home page:", err);
      }
    }
    loadCourses();
  }, []);

  useEffect(() => {
    async function loadEnrollments() {
      if (userId) {
        try {
          const res = await learningService.getEnrollments(userId);
          if (res.success && Array.isArray(res.data)) {
            setEnrolled(res.data.map((item) => item.course_id));
          }
        } catch (err) {
          console.error("Failed to load enrollments:", err);
        }
      }
    }
    loadEnrollments();
  }, [userId]);

  const handleCourseAction = async (e, courseId, isEnrolled) => {
    if (e && e.stopPropagation) e.stopPropagation();
    if (isEnrolled) {
      navigate(`/course/${courseId}`);
    } else {
      if (!userId) {
        navigate("/login");
        return;
      }
      try {
        const res = await learningService.enrollCourse(userId, courseId);
        if (res.success) {
          setEnrolled((prev) => [...prev, courseId]);
          navigate(`/course/${courseId}`);
        } else {
          navigate("/courses");
        }
      } catch {
        navigate("/courses");
      }
    }
  };

  useEffect(() => {
    const targetDate = new Date();
    targetDate.setDate(targetDate.getDate() + 2);

    const updateTimer = () => {
      const now = new Date().getTime();
      const distance = targetDate.getTime() - now;

      if (distance <= 0) {
        setTimeLeft({ days: 0, hours: 0, minutes: 0, seconds: 0 });
        return;
      }

      setTimeLeft({
        days: Math.floor(distance / (1000 * 60 * 60 * 24)),
        hours: Math.floor((distance / (1000 * 60 * 60)) % 24),
        minutes: Math.floor((distance / 1000 / 60) % 60),
        seconds: Math.floor((distance / 1000) % 60),
      });
    };

    updateTimer();
    const interval = setInterval(updateTimer, 1000);
    return () => clearInterval(interval);
  }, []);

  const featureData = [
    {
      icon: faGraduationCap,
      title: "Scholarship Facility",
      desc: "Originality is the essence of true scholarship.",
      color: "primary"
    },
    {
      icon: faStar,
      title: "Valuable Courses",
      desc: "Online education is like a rising tide—it lifts all boats.",
      color: "warning"
    },
    {
      icon: faAward,
      title: "Global Certification",
      desc: "A certificate without knowledge is like a gun without bullets.",
      color: "accent"
    }
  ];

  return (
    <div className="bg-gray-50 min-h-screen">
      <Navbar page="home" />

      {/* Hero Section */}
      <section className="relative text-center px-6 h-screen overflow-hidden flex items-center justify-center">
        <div className="absolute inset-0">
          <img
            src={bannerImg}
            alt="EduVerse Banner"
            className="w-full h-full object-cover blur-md opacity-80 brightness-50"
          />
          <div className="absolute inset-0 bg-black/20"></div>
        </div>

        {/* Content */}
        <div className="relative z-10">
          <h2 className="text-3xl sm:text-4xl md:text-5xl lg:text-6xl font-extrabold leading-snug mb-6 text-gray-100 animate-fadeInUp">
            Enhance your future with <br />
            <span className="sm:text-4xl md:text-5xl lg:text-6xl mt-6 text-white">
              Nexora
            </span>
          </h2>
          <p className="text-gray-200 max-w-2xl mx-auto text-lg md:text-xl animate-fadeInUp delay-200">
            Unlock your potential with hundreds of courses, certifications, and skills to grow your career.
          </p>
          <div className="mt-8 flex justify-center gap-4 animate-fadeInUp delay-400">
            <button
              onClick={() => navigate("/courses")}
              className="px-6 py-3 rounded-xl bg-warning/80 text-black font-semibold hover:bg-warning transition"
            >
              Explore Courses
            </button>
            <a
              href="#features"
              className="px-6 py-3 rounded-xl bg-white text-primary font-semibold hover:bg-gray-100 transition"
            >
              Learn More
            </a>
          </div>
        </div>
      </section>


      {/* Features Section */}
      <section id="features" className="px-6 py-16 text-center">
        <h1 className="text-3xl font-bold mb-4">Awesome Features</h1>
        <p className="text-gray-600 mb-10">Chance to enhance yourself</p>
        <div className="grid md:grid-cols-3 gap-8 md:px-24">
          {featureData.map((feature, index) => (
            <div
              key={index}
              className="p-6 rounded-xl bg-white shadow-md hover:shadow-lg transition transform hover:-translate-y-1"
            >
              <FontAwesomeIcon
                icon={feature.icon}
                className={`text-${feature.color}-500 text-4xl text-warning-dark mb-4`}
              />
              <h3 className="text-xl font-semibold mb-2">{feature.title}</h3>
              <p className="text-gray-600">{feature.desc}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Courses Section */}
      <section id="course" className="px-6 py-16 bg-gray-100">
        <h1 className="text-3xl font-bold text-center mb-2">
          Our Popular Courses
        </h1>
        <p className="text-gray-600 text-center mb-10">Explore our curated top-rated courses • Free for all learners</p>
        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-8 md:px-24">
          {courses.slice(0, 6).map((course) => {
            const courseId = course.course_id || course.id;
            const isEnrolled = enrolled.includes(courseId);

            return (
              <div
                key={courseId}
                onClick={(e) => handleCourseAction(e, courseId, isEnrolled)}
                className="bg-white rounded-xl shadow-md hover:shadow-xl overflow-hidden transition transform hover:-translate-y-1 cursor-pointer flex flex-col group"
              >
                <div className="relative overflow-hidden h-44 bg-gray-100">
                  <img
                    src={course.p_link || c1}
                    alt={course.course_name}
                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                  />
                  {/* Top-Left Status Badge */}
                  <div className="absolute top-3 left-3">
                    {isEnrolled ? (
                      <span className="bg-emerald-600/95 text-white px-2.5 py-1 rounded-full text-xs font-bold shadow-md flex items-center gap-1 backdrop-blur-sm border border-emerald-400/30">
                        ✓ Enrolled
                      </span>
                    ) : (
                      <span className="bg-amber-500/95 text-white px-2.5 py-1 rounded-full text-xs font-bold shadow-md backdrop-blur-sm border border-amber-400/30">
                        Not Enrolled
                      </span>
                    )}
                  </div>
                  {/* Top-Right Free Badge */}
                  <span className="absolute top-3 right-3 bg-indigo-600/90 text-white text-xs px-2.5 py-1 rounded-full font-medium backdrop-blur-sm">
                    Free
                  </span>
                </div>
                <div className="p-5 flex-1 flex flex-col justify-between">
                  <div>
                    <h6 className="text-lg font-bold text-gray-900 mb-1 group-hover:text-indigo-600 transition">
                      {course.course_name}
                    </h6>
                    <p className="text-sm text-gray-500 mb-3">
                      by {course.instructor || "Instructor"}
                    </p>
                  </div>
                  <div>
                    <div className="flex items-center text-amber-500 mb-3">
                      {[...Array(5)].map((_, i) => (
                        <FontAwesomeIcon key={i} icon={faStar} />
                      ))}
                      <span className="ml-2 text-gray-500 text-sm font-medium">4.9 (240+)</span>
                    </div>
                    <div className="flex items-center justify-between pt-3 border-t border-gray-100">
                      {isEnrolled ? (
                        <>
                          <span className="text-xs font-semibold uppercase tracking-wider text-emerald-700 bg-emerald-50 px-2.5 py-1 rounded-md border border-emerald-200">
                            ✓ Enrolled
                          </span>
                          <span className="text-indigo-600 font-semibold text-sm group-hover:translate-x-1 transition-transform flex items-center gap-1">
                            Start Learning →
                          </span>
                        </>
                      ) : (
                        <>
                          <span className="text-xs font-semibold uppercase tracking-wider text-amber-700 bg-amber-50 px-2.5 py-1 rounded-md border border-amber-200">
                            Not Enrolled
                          </span>
                          <span className="text-blue-600 font-semibold text-sm group-hover:translate-x-1 transition-transform flex items-center gap-1">
                            Enroll Now →
                          </span>
                        </>
                      )}
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
        <div className="text-center mt-12">
          <button
            onClick={() => navigate("/courses")}
            className="px-8 py-3 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition transform hover:-translate-y-0.5"
          >
            Browse All 10 Courses →
          </button>
        </div>
      </section>

      {/* Registration Section with Timer */}
      <section className="relative px-6 py-24 flex flex-col items-center justify-center text-center bg-secondary/20">
        <div className="relative z-10 max-w-3xl">
          <p className="font-bold mb-4 text-lg uppercase tracking-wider text-warning-dark">
            Get 100 Online Courses for Free
          </p>
          <h1 className="text-4xl md:text-5xl font-extrabold mb-8 leading-tight">
            Register Now and Unlock Your Learning Journey
          </h1>
          <p className="mb-12 text-lg">
            Join thousands of learners and access our top courses for free. Enhance your skills, earn certifications, and grow your future.
          </p>

          <div className="flex flex-wrap md:gap-6 gap-2 justify-center">
            {[
              { label: "Days", value: timeLeft.days },
              { label: "Hours", value: timeLeft.hours },
              { label: "Minutes", value: timeLeft.minutes },
              { label: "Seconds", value: timeLeft.seconds },
            ].map((item, index) => (
              <div
                key={index}
                className="flex flex-col items-center justify-center bg-white/20 backdrop-blur-md md:px-8 md:py-6 px-2 md:rounded-2xl rounded-lg shadow-xl"
              >
                <p className="md:text-4xl md:text-5xl font-extrabold text-primary/70">
                  {item.value}
                </p>
                <span className="text-sm font-semibold mt-1 tracking-wide">
                  {item.label}
                </span>
              </div>
            ))}
          </div>

          <div className="mt-10">
            <button
              onClick={() => navigate("/courses")}
              className="px-8 py-3.5 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition transform hover:-translate-y-0.5 cursor-pointer"
            >
              Start Learning for Free →
            </button>
          </div>
        </div>
      </section>

      <Footer />
    </div>
  );
}

export default Home;