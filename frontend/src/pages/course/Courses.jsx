import React, { useState, useEffect, useMemo } from "react";
import Navbar from "../../Components/common/Navbar";
import { useNavigate } from "react-router-dom";
import { message } from "antd";
import { courseService } from "../../api/course.service";
import { learningService } from "../../api/learning.service";

function Courses() {
  const [courses, setCourses] = useState([]);
  const [enrolled, setEnrolled] = useState([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");
  const [sortBy, setSortBy] = useState("name");
  const [filterBy, setFilterBy] = useState("all");
  const [displayCount, setDisplayCount] = useState(12);

  const userId = localStorage.getItem("id");
  const authToken = localStorage.getItem("token");
  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const coursesRes = await courseService.getAllCourses();
        if (coursesRes.success) setCourses(Array.isArray(coursesRes.data) ? coursesRes.data : []);

        if (userId) {
          const enrollmentsRes = await learningService.getEnrollments(userId);
          if (enrollmentsRes.success && Array.isArray(enrollmentsRes.data)) {
            setEnrolled(enrollmentsRes.data.map((item) => item.course_id));
          }
        }
      } catch (err) {
        console.error("Error loading courses:", err);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [userId]);

  const filteredAndSortedCourses = useMemo(() => {
    if (!Array.isArray(courses)) return [];

    let filtered = courses.filter(course => {
      const matchesSearch =
        course.course_name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        course.instructor?.toLowerCase().includes(searchTerm.toLowerCase());

      if (filterBy === "enrolled") return matchesSearch && enrolled.includes(course.course_id);
      if (filterBy === "available") return matchesSearch && !enrolled.includes(course.course_id);
      return matchesSearch;
    });

    filtered.sort((a, b) => {
      switch (sortBy) {
        case "name":
          return (a.course_name || "").localeCompare(b.course_name || "");
        case "instructor":
          return (a.instructor || "").localeCompare(b.instructor || "");
        case "price":
          const priceA = parseFloat(String(a.price).replace(/[^0-9.]/g, "")) || 0;
          const priceB = parseFloat(String(b.price).replace(/[^0-9.]/g, "")) || 0;
          return priceA - priceB;
        default:
          return 0;
      }
    });

    return filtered;
  }, [courses, searchTerm, sortBy, filterBy, enrolled]);

  const displayedCourses = filteredAndSortedCourses.slice(0, displayCount);

  const enrollCourse = async (courseId) => {
    if (!authToken) {
      message.error("You need to login to continue");
      setTimeout(() => navigate("/login"), 2000);
      return;
    }

    const res = await learningService.enrollCourse(userId, courseId);

    // ✅ FIX: just check res.success — don't compare res.data string
    if (res.success) {
      message.success("Course enrolled successfully!");
      setEnrolled(prev => [...prev, courseId]); // ✅ update UI instantly
      setTimeout(() => navigate(`/course/${courseId}`), 1500);
    } else {
      message.error(res.error || "Enrollment failed. Please try again.");
    }
  };

  const loadMore = () => {
    setDisplayCount(prev => prev + 6);
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <Navbar page="courses" />

      <div className="max-w-7xl mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex flex-col md:flex-row gap-4 mb-6">
            <div className="flex-1">
              <input
                type="text"
                placeholder="Search courses or instructors..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full px-4 py-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none"
              />
            </div>

            <div className="flex gap-3">
              <select
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
                className="px-4 py-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none bg-white"
              >
                <option value="name">Sort by Name</option>
                <option value="instructor">Sort by Instructor</option>
              </select>

              <select
                value={filterBy}
                onChange={(e) => setFilterBy(e.target.value)}
                className="px-4 py-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none bg-white font-medium"
              >
                <option value="all">All Courses</option>
                <option value="enrolled">Enrolled Courses</option>
                <option value="available">Not Enrolled</option>
              </select>
            </div>
          </div>

          <div className="flex items-center justify-between text-sm text-gray-600">
            <span>Showing {displayedCourses.length} of {filteredAndSortedCourses.length} courses</span>
            {searchTerm && (
              <button onClick={() => setSearchTerm("")} className="text-blue-600 hover:text-blue-800">
                Clear search
              </button>
            )}
          </div>
        </div>

        {loading ? (
          <div className="flex justify-center items-center h-64">
            <div className="w-8 h-8 border-2 border-blue-600 border-t-transparent rounded-full animate-spin"></div>
          </div>
        ) : filteredAndSortedCourses.length === 0 ? (
          <div className="flex flex-col justify-center items-center h-64 text-center">
            <p className="text-gray-500 text-lg mb-2">No courses found</p>
            <p className="text-gray-400 text-sm">Try adjusting your search or filters</p>
          </div>
        ) : (
          <>
            <div className="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
              {displayedCourses.map((course) => {
                const isEnrolled = enrolled.includes(course.course_id);
                return (
                  <div
                    key={course.course_id}
                    className="bg-white rounded-2xl shadow-lg border border-gray-100 hover:shadow-2xl hover:-translate-y-1 transition-all duration-300 overflow-hidden group flex flex-col justify-between"
                  >
                    <div
                      className="relative overflow-hidden cursor-pointer"
                      onClick={() => {
                        if (isEnrolled) {
                          navigate(`/course/${course.course_id}`);
                        } else {
                          enrollCourse(course.course_id);
                        }
                      }}
                      title={isEnrolled ? "Click to view course lessons" : "Click to enroll for free"}
                    >
                      <img
                        src={course.p_link}
                        alt={course.course_name}
                        className="h-48 w-full object-cover group-hover:scale-105 transition-transform duration-300"
                      />
                      {/* Top Left Status Badge */}
                      <div className="absolute top-3 left-3">
                        {isEnrolled ? (
                          <span className="bg-emerald-600/95 text-white px-3 py-1 rounded-full text-xs font-bold shadow-md flex items-center gap-1 backdrop-blur-sm border border-emerald-400/30">
                            ✓ Enrolled
                          </span>
                        ) : (
                          <span className="bg-amber-500/95 text-white px-3 py-1 rounded-full text-xs font-bold shadow-md backdrop-blur-sm border border-amber-400/30">
                            Not Enrolled
                          </span>
                        )}
                      </div>
                      {/* Top Right Free Badge */}
                      <div className="absolute top-3 right-3">
                        <span className="bg-indigo-600/90 text-white px-2.5 py-1 rounded-full text-xs font-semibold backdrop-blur-sm shadow-sm">
                          Free
                        </span>
                      </div>
                    </div>

                    <div className="p-6 flex-1 flex flex-col justify-between">
                      <div>
                        <h3
                          onClick={() => {
                            if (isEnrolled) {
                              navigate(`/course/${course.course_id}`);
                            } else {
                              enrollCourse(course.course_id);
                            }
                          }}
                          className="text-xl font-bold text-gray-900 mb-2 line-clamp-2 group-hover:text-blue-600 transition-colors duration-200 cursor-pointer"
                          title="Open course details"
                        >
                          {course.course_name && course.course_name.length < 8
                            ? `${course.course_name} Tutorial`
                            : course.course_name}
                        </h3>

                        <p className="text-gray-500 text-sm mb-4 flex items-center">
                          <span className="w-2 h-2 bg-blue-500 rounded-full mr-2"></span>
                          by {course.instructor}
                        </p>

                        <div className="flex items-center justify-between text-xs py-2 px-3 bg-gray-50 rounded-lg mb-4 border border-gray-100">
                          <span className="text-gray-500 font-medium">Status:</span>
                          {isEnrolled ? (
                            <span className="font-bold text-emerald-700 bg-emerald-100/90 px-2 py-0.5 rounded-md">
                              ✓ Enrolled
                            </span>
                          ) : (
                            <span className="font-bold text-amber-700 bg-amber-100/90 px-2 py-0.5 rounded-md">
                              Not Enrolled
                            </span>
                          )}
                        </div>
                      </div>

                      <div className="pt-2">
                        {isEnrolled ? (
                          <button
                            onClick={() => navigate(`/course/${course.course_id}`)}
                            className="w-full py-3 rounded-xl bg-gradient-to-r from-emerald-600 to-teal-600 text-white font-semibold hover:from-emerald-700 hover:to-teal-700 transition-all duration-200 shadow-md hover:shadow-lg flex items-center justify-center gap-2 cursor-pointer"
                          >
                            <span>✓ Enrolled</span>
                            <span className="text-emerald-100 text-xs font-normal">• Start Learning →</span>
                          </button>
                        ) : (
                          <button
                            onClick={() => enrollCourse(course.course_id)}
                            className="w-full py-3 rounded-xl bg-gradient-to-r from-blue-600 to-indigo-600 text-white font-semibold hover:from-blue-700 hover:to-indigo-700 transition-all duration-200 shadow-md hover:shadow-lg flex items-center justify-center gap-2 cursor-pointer"
                          >
                            <span>Enroll Now (Free)</span>
                          </button>
                        )}
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>

            {displayedCourses.length < filteredAndSortedCourses.length && (
              <div className="text-center mt-8">
                <button
                  onClick={loadMore}
                  className="px-8 py-3 bg-white border border-gray-200 text-gray-700 font-medium rounded-lg hover:bg-gray-50 transition-colors duration-200"
                >
                  Load More Courses
                </button>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  );
}

export default Courses;