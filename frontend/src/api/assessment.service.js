import api from "./api";

async function getQuestions(courseId) {
  try {
    const { data } = await api.get(`/api/assessments/${courseId}/`);
    return { success: true, data: Array.isArray(data.data) ? data.data : [] };
  } catch (err) {
    console.error("Error fetching questions:", err);
    return { success: false, error: "Unable to fetch questions" };
  }
}

async function submitAssessment(userId, courseId, marks) {
  try {
    const payload = { user_id: userId, course_id: courseId, marks: marks };
    const { data } = await api.post(`/api/assessments/`, payload);
    return { success: true, data };
  } catch (err) {
    console.error("Error submitting assessment:", err);
    return { success: false, error: "Unable to submit assessment" };
  }
}

export const assessmentService = {
  getQuestions,
  submitAssessment,
};