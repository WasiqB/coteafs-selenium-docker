# docker-test-env
Testing Environment in Docker container

## Usage
```bash
$ docker run \
  --rm \                    # Remove container after run.
  -p 5900:5900 \            # Map local VNC Port.
  -v "$PWD":/usr/src \      # Mount the project dir.
  wasiqb/selenium-practice  # Image name.
```
