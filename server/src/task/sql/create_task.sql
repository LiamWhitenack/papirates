-- server/src/task/sql/create_task.sql

INSERT INTO tasks (name, description, completed)
VALUES ($1, $2, $3)
RETURNING
  id,
  name,
  description,
  completed,
  created_at,
  updated_at