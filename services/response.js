function send(res, statusCode, success, message, data = null) {
  return res.status(statusCode).json({ success, message, data });
}

function ok(res, message = "OK", data = null) {
  return send(res, 200, true, message, data);
}

function created(res, message = "Created", data = null) {
  return send(res, 201, true, message, data);
}

function badRequest(res, message = "Bad request", data = null) {
  return send(res, 400, false, message, data);
}

function unauthorized(res, message = "Unauthorized", data = null) {
  return send(res, 401, false, message, data);
}

function forbidden(res, message = "Forbidden", data = null) {
  return send(res, 403, false, message, data);
}

function notFound(res, message = "Not found", data = null) {
  return send(res, 404, false, message, data);
}

function conflict(res, message = "Conflict", data = null) {
  return send(res, 409, false, message, data);
}

function serverError(res, message = "Server error.", error) {
  if (error) console.error(error);
  return send(res, 500, false, message, null);
}

module.exports = {
  ok,
  created,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  conflict,
  serverError,
};


