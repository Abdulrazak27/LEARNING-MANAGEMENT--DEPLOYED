import React, { useState, useEffect } from "react";
import { Table, Input, Tag, Card, Avatar } from "antd";
import { SearchOutlined, UserOutlined, BookOutlined, CheckCircleOutlined } from "@ant-design/icons";
import { adminService } from "../../api/admin.service";

function DEnrollments() {
  const [enrollments, setEnrollments] = useState([]);
  const [loading, setLoading] = useState(false);
  const [search, setSearch] = useState("");

  useEffect(() => {
    fetchEnrollments();
  }, []);

  const fetchEnrollments = async () => {
    setLoading(true);
    try {
      const res = await adminService.getAllLearning();
      if (res.success && Array.isArray(res.data)) {
        setEnrollments(res.data);
      }
    } catch (err) {
      console.error("Error fetching enrollments:", err);
    } finally {
      setLoading(false);
    }
  };

  const filtered = enrollments.filter((item) => {
    const q = search.toLowerCase();
    return (
      (item.username && item.username.toLowerCase().includes(q)) ||
      (item.email && item.email.toLowerCase().includes(q)) ||
      (item.course_name && item.course_name.toLowerCase().includes(q))
    );
  });

  const uniqueUsers = new Set(enrollments.map((e) => e.email || e.user_id)).size;
  const uniqueCourses = new Set(enrollments.map((e) => e.course_name || e.course_id)).size;

  const columns = [
    {
      title: "#",
      key: "idx",
      width: 60,
      render: (_, __, i) => <span className="text-gray-400 font-mono text-xs">{i + 1}</span>,
    },
    {
      title: "Student",
      key: "student",
      render: (_, r) => (
        <div className="flex items-center gap-3">
          <Avatar icon={<UserOutlined />} className="bg-indigo-600" />
          <div>
            <div className="font-semibold text-gray-900 text-sm">{r.username || "Learner"}</div>
            <div className="text-xs text-gray-500">{r.email || "No email"}</div>
          </div>
        </div>
      ),
    },
    {
      title: "Course Enrolled",
      key: "course",
      render: (_, r) => (
        <div className="flex items-center gap-2">
          <BookOutlined className="text-indigo-600" />
          <span className="font-semibold text-slate-800">{r.course_name || "Course"}</span>
        </div>
      ),
    },
    {
      title: "Status",
      key: "status",
      width: 140,
      render: () => (
        <Tag color="success" className="font-semibold px-2 py-0.5 rounded-full flex items-center gap-1 w-max">
          <CheckCircleOutlined /> Active Enrolled
        </Tag>
      ),
    },
    {
      title: "Enrollment ID",
      dataIndex: "id",
      key: "id",
      width: 180,
      render: (id) => <span className="font-mono text-xs text-gray-400">{id ? String(id).slice(0, 16) : "—"}</span>,
    },
  ];

  return (
    <div className="space-y-6">
      {/* KPI Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex items-center justify-between">
          <div>
            <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider">Total Enrollments</p>
            <h3 className="text-3xl font-extrabold text-indigo-600 mt-1">{enrollments.length}</h3>
          </div>
          <div className="w-12 h-12 rounded-xl bg-indigo-50 text-indigo-600 flex items-center justify-center text-xl font-bold">
            🎓
          </div>
        </div>

        <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex items-center justify-between">
          <div>
            <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider">Enrolled Students</p>
            <h3 className="text-3xl font-extrabold text-emerald-600 mt-1">{uniqueUsers}</h3>
          </div>
          <div className="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center text-xl font-bold">
            👥
          </div>
        </div>

        <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex items-center justify-between">
          <div>
            <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider">Active Courses</p>
            <h3 className="text-3xl font-extrabold text-purple-600 mt-1">{uniqueCourses}</h3>
          </div>
          <div className="w-12 h-12 rounded-xl bg-purple-50 text-purple-600 flex items-center justify-center text-xl font-bold">
            📚
          </div>
        </div>
      </div>

      {/* Main Table Card */}
      <Card className="rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-6">
          <div>
            <h2 className="text-xl font-bold text-gray-900">Student Enrollments & Learning Progress</h2>
            <p className="text-xs text-gray-500 mt-0.5">Real-time enrollment log of all learners across 10 courses</p>
          </div>
          <Input
            prefix={<SearchOutlined className="text-gray-400" />}
            placeholder="Search student, email, or course..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full sm:w-72 rounded-xl"
            allowClear
          />
        </div>

        <Table
          columns={columns}
          dataSource={filtered}
          rowKey={(r) => r.id || `${r.user_id}-${r.course_id}`}
          loading={loading}
          pagination={{ pageSize: 10, showTotal: (t) => `Total ${t} enrollments` }}
        />
      </Card>
    </div>
  );
}

export default DEnrollments;
