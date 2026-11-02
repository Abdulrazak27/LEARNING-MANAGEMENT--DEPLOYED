import React, { useState, useEffect } from "react";
import { Table, Card, Input, Empty } from "antd";
import { MessageOutlined, SearchOutlined, BookOutlined } from "@ant-design/icons";
import { adminService } from "../../api/admin.service";

function DFeedback() {
  const [feedbacks, setFeedbacks] = useState([]);
  const [loading, setLoading] = useState(false);
  const [search, setSearch] = useState("");

  useEffect(() => {
    fetchFeedbacks();
  }, []);

  const fetchFeedbacks = async () => {
    setLoading(true);
    try {
      const res = await adminService.getAllFeedback();
      if (res.success && Array.isArray(res.data)) {
        setFeedbacks(res.data);
      }
    } catch (err) {
      console.error("Error loading feedbacks:", err);
    } finally {
      setLoading(false);
    }
  };

  const filtered = feedbacks.filter((f) => {
    const q = search.toLowerCase();
    return (
      (f.comment && f.comment.toLowerCase().includes(q)) ||
      (f.course_name && f.course_name.toLowerCase().includes(q))
    );
  });

  const columns = [
    {
      title: "#",
      key: "idx",
      width: 50,
      render: (_, __, i) => <span className="text-gray-400 font-mono text-xs">{i + 1}</span>,
    },
    {
      title: "Course",
      dataIndex: "course_name",
      key: "course_name",
      width: 240,
      render: (name) => (
        <div className="flex items-center gap-2">
          <BookOutlined className="text-indigo-600" />
          <span className="font-semibold text-gray-800 text-sm">{name || "Course Feedback"}</span>
        </div>
      ),
    },
    {
      title: "Student Review / Feedback",
      dataIndex: "comment",
      key: "comment",
      render: (text) => (
        <div className="p-3 bg-gray-50 rounded-xl border border-gray-100 text-gray-700 text-sm italic">
          "{text || "Great course content!"}"
        </div>
      ),
    },
    {
      title: "Feedback ID",
      dataIndex: "id",
      key: "id",
      width: 180,
      render: (id) => <span className="font-mono text-xs text-gray-400">{id ? String(id).slice(0, 16) : "—"}</span>,
    },
  ];

  return (
    <div className="space-y-6">
      <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
            <MessageOutlined className="text-indigo-600" />
            Course Reviews & Feedback
          </h1>
          <p className="text-sm text-gray-500 mt-1">
            Total {feedbacks.length} student reviews collected across courses
          </p>
        </div>

        <Input
          prefix={<SearchOutlined className="text-gray-400" />}
          placeholder="Filter reviews by text or course..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full sm:w-72 rounded-xl"
          allowClear
        />
      </div>

      <Card className="rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
        {feedbacks.length === 0 && !loading ? (
          <Empty description="No feedback submitted yet by students" className="py-12" />
        ) : (
          <Table
            columns={columns}
            dataSource={filtered}
            rowKey={(r) => r.id || Math.random()}
            loading={loading}
            pagination={{ pageSize: 8, showTotal: (t) => `Total ${t} reviews` }}
          />
        )}
      </Card>
    </div>
  );
}

export default DFeedback;
