import axiosInstance from "../axiosConfig";
import { useState, useEffect } from "react";

const CreateData = async (path, data) => {
  const encodedCredentials = sessionStorage.getItem("encodedCredentials");
  const config = {
    headers: {
      Authorization: `Basic ${encodedCredentials}`,
    },
  };
  try {
    const response = await axiosInstance.post(path, data, config);
    return response.data;
  } catch (error) {
    console.error(`Error creating ${path}:`, error);
    return error.response.data;
  }
};

const CreateDataWithState = (path, data) => {
  const [resultData, setResultData] = useState(null);
  const [loading, setLoading] = useState(false);
  useEffect(() => {
    setLoading(true);
    const encodedCredentials = sessionStorage.getItem("encodedCredentials");
    const config = {
      headers: {
        Authorization: `Basic ${encodedCredentials}`,
      },
    };
    try {
      axiosInstance.post(path, data, config).then((res) => {
        setResultData(res.data);
        setLoading(false);
      });
    } catch (error) {
      setLoading(false);
      console.error(`Error fetching ${path}s:`, error);
      setResultData(error.response.data);
    }
  }, [path, data]);

  return [resultData, setResultData, loading, setLoading];
};

const UpdateData = async (path, data) => {
  const encodedCredentials = sessionStorage.getItem("encodedCredentials");
  const config = {
    headers: {
      Authorization: `Basic ${encodedCredentials}`,
    },
  };
  try {
    const response = await axiosInstance.put(path, data, config);
    return response.data;
  } catch (error) {
    console.error(`Error creating ${path}:`, error);
    return error.response.data;
  }
};

const PartialUpdateData = async (path, data) => {
  const encodedCredentials = sessionStorage.getItem("encodedCredentials");
  const config = {
    headers: {
      Authorization: `Basic ${encodedCredentials}`,
    },
  };
  try {
    const response = await axiosInstance.patch(path, data, config);
    return response.data;
  } catch (error) {
    console.error(`Error creating ${path}:`, error);
    return error.response != null ? error.response.data : {};
  }
};

const DeleteData = async (path, id) => {
  const encodedCredentials = sessionStorage.getItem("encodedCredentials");
  const config = {
    headers: {
      Authorization: `Basic ${encodedCredentials}`,
    },
  };
  try {
    const response = await axiosInstance.delete(`${path}/${id}`, config);
    return response.data;
  } catch (error) {
    console.error(`Error deleting ${path}:`, error);
    return error.response.data;
  }
};

const DeleteDataAll = async (path, ids) => {
  const encodedCredentials = sessionStorage.getItem("encodedCredentials");
  const config = {
    headers: {
      Authorization: `Basic ${encodedCredentials}`,
    },
  };

  try {
    // Assuming you want to delete multiple items, iterate through the array of ids
    const deleteRequests = ids.map(async (id) => {
      const response = await axiosInstance.delete(`${path}/${id}`, config);
      return response.data;
    });

    // Use Promise.all to wait for all delete requests to complete
    const responseData = await Promise.all(deleteRequests);

    return responseData;
  } catch (error) {
    console.error(`Error deleting ${path}:`, error);

    // If any of the delete requests fail, you can handle the error here
    // For now, returning the error response data of the first failed request
    return error.response.data;
  }
};

const DeleteDataWithState = async (path, id) => {
  const [data, setData] = useState(null);
  useEffect(() => {
    const encodedCredentials = sessionStorage.getItem("encodedCredentials");
    const config = {
      headers: {
        Authorization: `Basic ${encodedCredentials}`,
      },
    };
    try {
      axiosInstance.delete(`${path}/${id}`, config).then((res) => {
        setData(res.data.data);
      });
    } catch (error) {
      console.error(`Error fetching ${path}s:`, error);
      setData(error.response.data);
    }
  }, [path, id]);
  return [data, setData];
};

const GetAllDataWithState = (path) => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  useEffect(() => {
    setLoading(true);
    const encodedCredentials = sessionStorage.getItem("encodedCredentials");
    const config = {
      headers: {
        Authorization: `Basic ${encodedCredentials}`,
      },
    };
    try {
      axiosInstance.get(path, config).then((res) => {
        setData(res.data);
        setLoading(false);
      });
    } catch (error) {
      setLoading(false);
      console.error(`Error fetching ${path}s:`, error);
      setData(error.response.data);
    }
  }, [path]);
  return [data, setData, loading, setLoading];
};

const GetAllData = async (path) => {
  const encodedCredentials = sessionStorage.getItem("encodedCredentials");
  const config = {
    headers: {
      Authorization: `Basic ${encodedCredentials}`,
    },
  };
  try {
    const res = await axiosInstance.get(path, config);

    return res;
  } catch (error) {
    console.error(`Error fetching ${path}s:`, error);
    return error.response.data;
  }
};

const GetByIdData = async (path, id) => {
  const encodedCredentials = sessionStorage.getItem("encodedCredentials");
  const config = {
    headers: {
      Authorization: `Basic ${encodedCredentials}`,
    },
  };
  try {
    const response = await axiosInstance.get(`${path}/${id}`, config);
    return response.data;
  } catch (error) {
    console.error(`Error fetching ${path}:`, error);
    return error.response.data;
  }
};
const GetByIdDataWithState = (path, id) => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  useEffect(() => {
    const encodedCredentials = sessionStorage.getItem("encodedCredentials");
    const config = {
      headers: {
        Authorization: `Basic ${encodedCredentials}`,
      },
    };
    try {
      axiosInstance.get(`${path}/${id}`, config).then((res) => {
        setData(res.data);
        setLoading(false);
      });
    } catch (error) {
      setLoading(false);
      console.error(`Error fetching ${path}s:`, error);
      setData(error.response.data);
    }
  }, [path, id]);
  return [data, setData, loading, setLoading];
};

const UseCreateDataWithState = (path, data) => {
  const [resultData, setResultData] = useState(null);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    setLoading(true);
    const encodedCredentials = sessionStorage.getItem("encodedCredentials");
    const config = {
      headers: {
        Authorization: `Basic ${encodedCredentials}`,
      },
    };
    try {
      axiosInstance
        .post(path, data, config)
        .then((res) => {
          setResultData(res.data);
          setLoading(false);
        })
        .catch((error) => {
          setLoading(false);
          console.error(`Error fetching ${path}:`, error);
          setResultData(error.response ? error.response.data : error.message);
        });
    } catch (error) {
      setLoading(false);
      console.error(`Error fetching ${path}:`, error);
      setResultData(error.message);
    }
  }, [path, data]);

  return [resultData, loading];
};

const RestService = {
  CreateData,
  UpdateData,
  DeleteData,
  DeleteDataAll,
  DeleteDataWithState,
  GetAllDataWithState,
  GetByIdData,
  GetAllData,
  CreateDataWithState,
  UseCreateDataWithState,
  PartialUpdateData,
  GetByIdDataWithState,
};

export default RestService;
