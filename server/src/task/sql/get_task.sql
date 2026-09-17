-- server/src/task/sql/get_task.sql

SELECT
  id,
  name,
  description,
  completed,
  created_at,
  updated_at
FROM tasks
WHERE id = $1