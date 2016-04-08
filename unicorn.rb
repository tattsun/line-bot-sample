worker_processes 2
working_directory '.'

timeout 300
listen 4567

pid "/tmp/unicorn.pid"

stderr_path "/tmp/unicorn.stderr.log"
stdout_path "/tmp/unicorn.stdout.log"
