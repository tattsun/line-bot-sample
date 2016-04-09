worker_processes 2
working_directory '.'

timeout 300
listen 4567

pid "./unicorn.pid"

stderr_path "./unicorn.stderr.log"
stdout_path "./unicorn.stdout.log"
