"""DevOps Student Application - Dauletkan Nursultan (IT2-2313, 37037)."""
import os
import signal
import sys
from http.server import BaseHTTPRequestHandler, HTTPServer

APP_VERSION = "1.0"
PORT = int(os.getenv("PORT", "5000"))

# Values come from environment variables; defaults are used if they are not set
STUDENT_NAME = os.getenv("STUDENT_NAME", "Nursultan")
STUDENT_SURNAME = os.getenv("STUDENT_SURNAME", "Dauletkan")
STUDENT_GROUP = os.getenv("STUDENT_GROUP", "IT2-2313")
STUDENT_ID = os.getenv("STUDENT_ID", "37037")


def banner():
    return (
        "================================\n"
        "DevOps Student Application\n"
        "================================\n\n"
        f"Name: {STUDENT_NAME}\n"
        f"Surname: {STUDENT_SURNAME}\n"
        f"Group: {STUDENT_GROUP}\n"
        f"Student ID: {STUDENT_ID}\n"
        f"Version: {APP_VERSION}\n\n"
        "Application is running successfully!\n"
    )


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        body = banner().encode()
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, fmt, *args):
        print(f"[request] {self.address_string()} {fmt % args}", flush=True)


def stop(*_):
    print("Application stopped.", flush=True)
    sys.exit(0)


if __name__ == "__main__":
    signal.signal(signal.SIGTERM, stop)
    signal.signal(signal.SIGINT, stop)
    print(banner(), flush=True)
    print(f"Listening on port {PORT}", flush=True)
    HTTPServer(("0.0.0.0", PORT), Handler).serve_forever()
