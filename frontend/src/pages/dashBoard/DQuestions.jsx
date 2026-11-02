import React, { useState, useEffect } from "react";
import { Table, Button, Modal, Form, Input, Select, message, Popconfirm, Tag, Card } from "antd";
import { PlusOutlined, DeleteOutlined, QuestionCircleOutlined, FilterOutlined } from "@ant-design/icons";
import { adminService } from "../../api/admin.service";

const { Option } = Select;

function DQuestions() {
  const [questions, setQuestions] = useState([]);
  const [courses, setCourses] = useState([]);
  const [loading, setLoading] = useState(false);
  const [selectedCourseFilter, setSelectedCourseFilter] = useState("all");
  const [isAddModalOpen, setIsAddModalOpen] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [form] = Form.useForm();

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    setLoading(true);
    try {
      const [qRes, cRes] = await Promise.all([
        adminService.getAllQuestions(),
        adminService.getAllCourses(),
      ]);

      if (qRes.success && Array.isArray(qRes.data)) {
        setQuestions(qRes.data);
      }
      if (cRes.success && Array.isArray(cRes.data)) {
        setCourses(cRes.data);
      }
    } catch {
      message.error("Failed to load questions data");
    } finally {
      setLoading(false);
    }
  };

  const getCourseName = (courseId) => {
    const course = courses.find((c) => c.course_id === courseId);
    return course ? course.course_name : "Course Question";
  };

  const handleDelete = async (questionId) => {
    try {
      const res = await adminService.deleteQuestion(questionId);
      if (res.success) {
        message.success("Question deleted successfully");
        setQuestions((prev) => prev.filter((q) => q.id !== questionId));
      } else {
        message.error("Failed to delete question");
      }
    } catch {
      message.error("Error deleting question");
    }
  };

  const handleAddQuestion = async (values) => {
    setSubmitting(true);
    try {
      const res = await adminService.createQuestion({
        course_id: values.course_id,
        question: values.question,
        option1: values.option1,
        option2: values.option2,
        option3: values.option3,
        option4: values.option4,
        answer: values.answer,
      });

      if (res.success) {
        message.success("New quiz question created successfully!");
        setIsAddModalOpen(false);
        form.resetFields();
        fetchData();
      } else {
        message.error(res.error || "Failed to create question");
      }
    } catch {
      message.error("Error creating question");
    } finally {
      setSubmitting(false);
    }
  };

  const filteredQuestions =
    selectedCourseFilter === "all"
      ? questions
      : questions.filter((q) => q.course_id === selectedCourseFilter);

  const columns = [
    {
      title: "#",
      key: "index",
      width: 50,
      render: (_, __, index) => <span className="text-gray-400 font-mono text-xs">{index + 1}</span>,
    },
    {
      title: "Course",
      dataIndex: "course_id",
      key: "course_id",
      width: 180,
      render: (courseId) => (
        <Tag color="purple" className="font-semibold text-xs py-0.5 px-2 rounded-md">
          {getCourseName(courseId)}
        </Tag>
      ),
    },
    {
      title: "Question",
      dataIndex: "question",
      key: "question",
      render: (text) => <span className="font-semibold text-gray-800 text-sm">{text}</span>,
    },
    {
      title: "Answer Options",
      key: "options",
      width: 320,
      render: (_, record) => (
        <div className="grid grid-cols-2 gap-1.5 text-xs">
          <div className={`p-1.5 rounded border ${record.answer === record.option1 ? "bg-emerald-50 border-emerald-300 text-emerald-800 font-bold" : "bg-gray-50 border-gray-200 text-gray-600"}`}>
            A: {record.option1}
          </div>
          <div className={`p-1.5 rounded border ${record.answer === record.option2 ? "bg-emerald-50 border-emerald-300 text-emerald-800 font-bold" : "bg-gray-50 border-gray-200 text-gray-600"}`}>
            B: {record.option2}
          </div>
          <div className={`p-1.5 rounded border ${record.answer === record.option3 ? "bg-emerald-50 border-emerald-300 text-emerald-800 font-bold" : "bg-gray-50 border-gray-200 text-gray-600"}`}>
            C: {record.option3}
          </div>
          <div className={`p-1.5 rounded border ${record.answer === record.option4 ? "bg-emerald-50 border-emerald-300 text-emerald-800 font-bold" : "bg-gray-50 border-gray-200 text-gray-600"}`}>
            D: {record.option4}
          </div>
        </div>
      ),
    },
    {
      title: "Correct Answer",
      dataIndex: "answer",
      key: "answer",
      width: 180,
      render: (answer) => (
        <Tag color="success" className="font-bold text-xs py-1 px-2.5 rounded-md">
          ✓ {answer}
        </Tag>
      ),
    },
    {
      title: "Action",
      key: "action",
      width: 90,
      render: (_, record) => (
        <Popconfirm
          title="Delete this question?"
          description="Are you sure you want to remove this quiz question?"
          onConfirm={() => handleDelete(record.id)}
          okText="Yes, Delete"
          cancelText="No"
          okButtonProps={{ danger: true }}
        >
          <Button danger icon={<DeleteOutlined />} size="small" />
        </Popconfirm>
      ),
    },
  ];

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
            <QuestionCircleOutlined className="text-purple-600" />
            Quiz & Assessment Questions Management
          </h1>
          <p className="text-sm text-gray-500 mt-1">
            Total {questions.length} quiz questions available across {courses.length} courses
          </p>
        </div>

        <div className="flex items-center gap-3 w-full md:w-auto">
          <Select
            value={selectedCourseFilter}
            onChange={setSelectedCourseFilter}
            className="w-56"
            prefix={<FilterOutlined />}
          >
            <Option value="all">All Courses ({questions.length})</Option>
            {courses.map((c) => (
              <Option key={c.course_id} value={c.course_id}>
                {c.course_name}
              </Option>
            ))}
          </Select>

          <Button
            type="primary"
            icon={<PlusOutlined />}
            onClick={() => setIsAddModalOpen(true)}
            className="bg-purple-600 hover:bg-purple-700 h-10 px-5 rounded-xl font-semibold shadow-md"
          >
            Add Question
          </Button>
        </div>
      </div>

      {/* Questions Table */}
      <Card className="rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
        <Table
          columns={columns}
          dataSource={filteredQuestions}
          rowKey="id"
          loading={loading}
          pagination={{ pageSize: 8, showTotal: (total) => `Total ${total} questions` }}
        />
      </Card>

      {/* Add Question Modal */}
      <Modal
        title="Add New Quiz Question"
        open={isAddModalOpen}
        onCancel={() => setIsAddModalOpen(false)}
        footer={null}
        destroyOnClose
      >
        <Form form={form} layout="vertical" onFinish={handleAddQuestion} className="mt-4">
          <Form.Item
            name="course_id"
            label="Target Course"
            rules={[{ required: true, message: "Please select a course" }]}
          >
            <Select placeholder="Select course">
              {courses.map((c) => (
                <Option key={c.course_id} value={c.course_id}>
                  {c.course_name}
                </Option>
              ))}
            </Select>
          </Form.Item>

          <Form.Item
            name="question"
            label="Question Prompt"
            rules={[{ required: true, message: "Please enter the question" }]}
          >
            <Input.TextArea rows={2} placeholder="e.g. Which hook is used for side effects in React?" />
          </Form.Item>

          <div className="grid grid-cols-2 gap-3">
            <Form.Item name="option1" label="Option A" rules={[{ required: true }]}>
              <Input placeholder="Option A" />
            </Form.Item>
            <Form.Item name="option2" label="Option B" rules={[{ required: true }]}>
              <Input placeholder="Option B" />
            </Form.Item>
            <Form.Item name="option3" label="Option C" rules={[{ required: true }]}>
              <Input placeholder="Option C" />
            </Form.Item>
            <Form.Item name="option4" label="Option D" rules={[{ required: true }]}>
              <Input placeholder="Option D" />
            </Form.Item>
          </div>

          <Form.Item
            name="answer"
            label="Correct Answer (Must match one of the options exactly)"
            rules={[{ required: true, message: "Please specify the correct answer" }]}
          >
            <Input placeholder="e.g. useEffect" />
          </Form.Item>

          <div className="flex justify-end gap-3 mt-6">
            <Button onClick={() => setIsAddModalOpen(false)}>Cancel</Button>
            <Button type="primary" htmlType="submit" loading={submitting} className="bg-purple-600">
              Create Question
            </Button>
          </div>
        </Form>
      </Modal>
    </div>
  );
}

export default DQuestions;
