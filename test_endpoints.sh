# List tasks — empty initially
curl -i http://localhost:8000/api/tasks
# 200 OK, []

# Create a task
curl -i -X POST http://localhost:8000/api/tasks \
  -H "Content-Type: application/json" \
  -d '{"name":"Buy milk","description":"2% fat"}'
# 201 Created, {"id":1,"name":"Buy milk","description":"2% fat","completed":false}

# Create another task
curl -i -X POST http://localhost:8000/api/tasks \
  -H "Content-Type: application/json" \
  -d '{"name":"Read a book","description":"Something good","completed":true}'
# 201 Created, {"id":2,...}

# List tasks — both tasks now returned
curl -i http://localhost:8000/api/tasks
# 200 OK, [{"id":1,...},{"id":2,...}]

# Show a task
curl -i http://localhost:8000/api/tasks/1
# 200 OK, {"id":1,"name":"Buy milk","description":"2% fat","completed":false}

# Update a task (partial fields)
curl -i -X PATCH http://localhost:8000/api/tasks/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Buy milk","description":"Whole milk","completed":true}'
# 200 OK, {"id":1,"name":"Buy milk","description":"Whole milk","completed":true}

# Delete a task
curl -i -X DELETE http://localhost:8000/api/tasks/1
# 204 No Content

# Show deleted task — 404
curl -i http://localhost:8000/api/tasks/1
# 404 Not Found

# Invalid ID — 404
curl -i http://localhost:8000/api/tasks/abc
# 404 Not Found

# Missing required field — 422
curl -i -X POST http://localhost:8000/api/tasks \
  -H "Content-Type: application/json" \
  -d '{"description":"No name field"}'
# 422 Unprocessable Content