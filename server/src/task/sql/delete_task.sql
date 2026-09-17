-- server/src/task/sql/delete_task.sql

DELETE FROM tasks
WHERE id = $1