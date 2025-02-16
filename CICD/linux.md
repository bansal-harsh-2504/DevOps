# Linux Commands Cheat Sheet

## 1. `curl`
`curl` (Client URL) is a command-line tool used to transfer data from or to a server using various protocols like HTTP, HTTPS, FTP, SCP, and more.

### Common Commands:
- **Download a file:**
  ```sh
  curl -O https://example.com/file.zip
  ```
- **Make an HTTP GET request:**
  ```sh
  curl -X GET https://api.example.com/data
  ```
- **Send data with POST:**
  ```sh
  curl -X POST -d "name=John&age=30" https://example.com/form
  ```
- **Fetch headers only:**
  ```sh
  curl -I https://example.com
  ```
- **Handle APIs with JSON:**
  ```sh
  curl -H "Content-Type: application/json" -d '{"key":"value"}' -X POST https://api.example.com
  ```

---

## 2. `lsof`
`lsof` (List Open Files) displays information about open files and the processes using them.

### Common Commands:
- **List all open files:**
  ```sh
  lsof
  ```
- **Find which process is using a specific file:**
  ```sh
  lsof /path/to/file
  ```
- **List all open files by a specific user:**
  ```sh
  lsof -u username
  ```
- **Find which process is using a specific port:**
  ```sh
  lsof -i :8080
  ```
- **Find network connections:**
  ```sh
  lsof -i tcp
  lsof -i udp
  ```
- **List open files for a specific process:**
  ```sh
  lsof -p <PID>
  ```

---

## 3. `kill`
The `kill` command is used to terminate processes by sending signals.

### Common Commands:
- **List running processes:**
  ```sh
  ps aux
  ```
- **Kill a process by PID:**
  ```sh
  kill <PID>
  ```
- **Force kill a process:**
  ```sh
  kill -9 <PID>
  ```
- **Kill all processes by name:**
  ```sh
  killall <process-name>
  ```
- **Kill a process using a specific port (e.g., port 3000):**
  ```sh
  kill -9 $(lsof -t -i :3000)
  ```

---

## 4. `pm2` (Process Manager for Node.js)
`pm2` is a process manager for Node.js applications, making it easy to run, monitor, and restart apps automatically.

### Installation:
```sh
npm install -g pm2
```

### Common Commands:
- **Start a Node.js app:**
  ```sh
  pm2 start app.js
  ```
- **Start with a custom name:**
  ```sh
  pm2 start app.js --name my-app
  ```
- **List all running processes:**
  ```sh
  pm2 list
  ```
- **Restart a process:**
  ```sh
  pm2 restart my-app
  ```
- **Stop a process:**
  ```sh
  pm2 stop my-app
  ```
- **Delete a process:**
  ```sh
  pm2 delete my-app
  ```
- **Monitor logs in real-time:**
  ```sh
  pm2 logs
  ```
- **Save processes to restart on reboot:**
  ```sh
  pm2 save
  ```
- **Enable startup script (auto-start on boot):**
  ```sh
  pm2 startup
  ```