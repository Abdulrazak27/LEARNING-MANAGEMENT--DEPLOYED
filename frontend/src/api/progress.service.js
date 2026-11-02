import api from "./api";

async function getProgress(userId, courseId) {
  try {
    const { data } = await api.get(`/api/progress/${userId}/${courseId}/`);
    return { success: true, data: data.progress ?? 0 };
  } catch (err) {
    console.error("Error fetching progress:", err);
    return { success: false, error: "Unable to fetch progress" };
  }
}

async function updateDuration(userId, courseId, duration) {
  try {
    await api.post(`/api/progress/update/${userId}/${courseId}/`, {
      played_time: 0,
      duration: duration,
    });
    return { success: true };
  } catch (err) {
    console.error("Error updating duration:", err);
    return { success: false, error: "Unable to update duration" };
  }
}

async function updateProgress(userId, courseId, playedTime, duration) {
  try {
    await api.post(`/api/progress/update/${userId}/${courseId}/`, {
      played_time: playedTime,
      duration: duration,
    });
    return { success: true };
  } catch (err) {
    console.error("Error updating progress:", err);
    return { success: false, error: "Unable to update progress" };
  }
}

export const progressService = {
  getProgress,
  updateDuration,
  updateProgress,
};